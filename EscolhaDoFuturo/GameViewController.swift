import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var storyView: UIView!
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var currentMonthlyIncome: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextView.text = GameManager.shared.textsList[0]
    }
    
    func updateGameView() {
        if GameManager.shared.control < GameManager.shared.textsList.count {
            storyTextView.text = GameManager.shared.textsList[GameManager.shared.control]
        } else if GameManager.shared.control == GameManager.shared.textsList.count {
            storyTextView.text = GameManager.shared.finalSceneList()
        } else {
            storyTextView.text = GameManager.moralScenesList[GameManager.shared.control - GameManager.shared.textsList.count - 1]
            if storyTextView.text == "End" {
                nextButton.removeFromSuperview()
            }
        }
        currentBalance.text = "\(GameManager.shared.FV.currencyBR)"
        currentMonthlyIncome.text = "\(String(format: "%.2f", GameManager.shared.PMT))"
        GameManager.shared.control += 1
    }
    
    func updateVariables(index: Int) {
        if GameManager.shared.decisionsList[GameManager.shared.control]?.answers[index][0] as! PerfisInvestidor != PerfisInvestidor.nenhum {
            GameManager.shared.perfilInvestidor = GameManager.shared.decisionsList[GameManager.shared.control]?.answers[index][0] as! PerfisInvestidor
        }
        GameManager.shared.FV += GameManager.shared.decisionsList[GameManager.shared.control]?.answers[index][1] as! Float
        GameManager.shared.PMT += GameManager.shared.decisionsList[GameManager.shared.control]?.answers[index][2] as! Float
        GameManager.shared.hasMoto = GameManager.shared.decisionsList[GameManager.shared.control]?.answers[index][3] as! Bool
        if let yieldN = GameManager.shared.timePastList[GameManager.shared.control] {
            self.getNewFV(n: yieldN)
        }
    }
    
    func getNewFV(n: Int) {
        GameManager.shared.FV = GameManager.shared.FV * powf((1 + GameManager.shared.i()), Float(n)) + GameManager.shared.PMT * (powf((1 + GameManager.shared.i()), Float(n)) - 1) / GameManager.shared.i()
    }
    
    func decisionViewTwoChoices(identifier: String) {
        if let vc = storyboard?.instantiateViewController(identifier: identifier) as? TwoChoicesViewController {
            storyView.addSubview(vc.view)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            vc.view.topAnchor.constraint(equalTo: storyView.topAnchor).isActive = true
            vc.view.trailingAnchor.constraint(equalTo: storyView.trailingAnchor).isActive = true
            vc.view.leadingAnchor.constraint(equalTo: storyView.leadingAnchor).isActive = true
            vc.view.bottomAnchor.constraint(equalTo: storyView.bottomAnchor).isActive = true
            vc.completion = { answer in
                vc.view.removeFromSuperview()
                self.updateVariables(index: answer)
                self.updateGameView()
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
            vc.completion = { answer in
                vc.view.removeFromSuperview()
                self.updateVariables(index: answer)
                self.updateGameView()
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
        }
    }
}
