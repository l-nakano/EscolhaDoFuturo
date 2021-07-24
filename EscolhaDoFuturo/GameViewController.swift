import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var storyView: UIView!
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var currentMonthlyIncome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextView.text = GameManager.shared.textsList[0]
        currentMonthlyIncome.transform = currentMonthlyIncome.transform.rotated(by: .pi/2)
    }
    
    func updateGameView() {
        storyTextView.text = GameManager.shared.textsList[GameManager.shared.control]
        currentBalance.text = "\(GameManager.shared.FV)"
        currentMonthlyIncome.text = "\(GameManager.shared.PMT)"
    }
    
    func decisionViewTwoChoices(identifier: String) {
        if let vc = storyboard?.instantiateViewController(identifier: identifier) as? TwoChoicesViewController {
            storyView.addSubview(vc.view)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            vc.view.topAnchor.constraint(equalTo: storyView.topAnchor).isActive = true
            vc.view.trailingAnchor.constraint(equalTo: storyView.trailingAnchor).isActive = true
            vc.view.leadingAnchor.constraint(equalTo: storyView.leadingAnchor).isActive = true
            vc.view.bottomAnchor.constraint(equalTo: storyView.bottomAnchor).isActive = true
            vc.completion = { [self] answer in
                vc.view.removeFromSuperview()
                switch GameManager.shared.decisionsList[GameManager.shared.control]?.varToChange {
                case .perfilInvestidor:
                    GameManager.shared.perfilInvestidor = GameManager.shared.decisionsList[GameManager.shared.control]?.answers[answer] as! PerfisInvestidor
                case .PMT:
                    GameManager.shared.PMT += GameManager.shared.decisionsList[GameManager.shared.control]?.answers[answer] as! Float
                    if let yieldN = GameManager.shared.yieldList[GameManager.shared.control] {
                        print(GameManager.shared.FV)
                        print(GameManager.shared.PMT)
                        print(GameManager.shared.i())
                        print(yieldN)
                        getNewFV(n: yieldN)
                    }
                case .VF:
                    GameManager.shared.FV += GameManager.shared.decisionsList[GameManager.shared.control]?.answers[answer] as! Float
                    if let yieldN = GameManager.shared.yieldList[GameManager.shared.control] {
                        print(GameManager.shared.FV)
                        print(GameManager.shared.PMT)
                        print(GameManager.shared.i())
                        print(yieldN)
                        getNewFV(n: yieldN)
                    }
                default:
                    fatalError("Não existe uma variável para modificar")
                }
                self.updateGameView()
                GameManager.shared.control += 1
            }
        }
    }
    
    func decisionViewThreeChoices(identifier: String) {
        if let vc = storyboard?.instantiateViewController(identifier: identifier) as? ThreeChoicesViewController {
            storyView.addSubview(vc.view)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            vc.view.topAnchor.constraint(equalTo: storyView.topAnchor).isActive = true
            vc.view.trailingAnchor.constraint(equalTo: storyView.trailingAnchor).isActive = true
            vc.view.leadingAnchor.constraint(equalTo: storyView.leadingAnchor).isActive = true
            vc.view.bottomAnchor.constraint(equalTo: storyView.bottomAnchor).isActive = true
            vc.completion = { [self] answer in
                vc.view.removeFromSuperview()
                switch GameManager.shared.decisionsList[GameManager.shared.control]?.varToChange {
                case .perfilInvestidor:
                    GameManager.shared.perfilInvestidor = GameManager.shared.decisionsList[GameManager.shared.control]?.answers[answer] as! PerfisInvestidor
                case .PMT:
                    GameManager.shared.PMT += GameManager.shared.decisionsList[GameManager.shared.control]?.answers[answer] as! Float
                    if let yieldN = GameManager.shared.yieldList[GameManager.shared.control] {
                        getNewFV(n: yieldN)
                    }
                case .VF:
                    GameManager.shared.FV += GameManager.shared.decisionsList[GameManager.shared.control]?.answers[answer] as! Float
                    if let yieldN = GameManager.shared.yieldList[GameManager.shared.control] {
                        getNewFV(n: yieldN)
                    }
                default:
                    fatalError("Não existe uma variável para modificar")
                }
                self.updateGameView()
                GameManager.shared.control += 1
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func getNewFV(n: Int) {
        GameManager.shared.FV = GameManager.shared.FV * powf((1 + GameManager.shared.i()), Float(n)) + GameManager.shared.PMT * (powf((1 + GameManager.shared.i()), Float(n)) - 1) / GameManager.shared.i()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if GameManager.shared.decisionsList.keys.contains(GameManager.shared.control) {
            switch GameManager.shared.decisionsList[GameManager.shared.control]?.choicesQty {
            case 3:
                self.decisionViewThreeChoices(identifier: "ThreeChoices")
            case 2:
                self.decisionViewTwoChoices(identifier: "TwoChoices")
            default:
                fatalError("Não existe uma view com essa quantidade de escolhas")
            }
        } else {
            updateGameView()
            GameManager.shared.control += 1
        }
    }
}
