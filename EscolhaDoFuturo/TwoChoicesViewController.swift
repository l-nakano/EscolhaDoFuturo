import UIKit

class TwoChoicesViewController: UIViewController {
    
    var completion: ((Int) -> Void)?

    @IBOutlet weak var decisionTextView: UITextView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshView()
    }
    
    func refreshView() {
        let buttonsList = [firstButton, secondButton],
            currentDecisionList = GameManager.shared.decisionsList[GameManager.shared.control]!
        
        for (index, button) in buttonsList.enumerated() {
            button!.layer.borderWidth = 1
            button!.layer.borderColor = UIColor(named: "ButtonBorderColor")?.cgColor
            button!.layer.backgroundColor = UIColor(named: "ButtonColor")?.cgColor
            button!.layer.cornerRadius = 10
            button!.contentEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
            button!.setTitleColor(UIColor(ciColor: .white), for: .normal)
            button!.setTitle(currentDecisionList.choicesLabel[index], for: .normal)
            button!.appear()
        }
        decisionTextView.text = currentDecisionList.question
        decisionTextView.appear()
    }
    
    func changeButtonLayout(_ button: UIButton) {
        
    }
    
    @IBAction func firstChoiceButton(_ sender: UIButton) {
        completion?(0)
    }
    
    @IBAction func secondChoiceButton(_ sender: UIButton) {
        completion?(1)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
