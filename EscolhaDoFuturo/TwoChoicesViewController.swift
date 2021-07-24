import UIKit

class TwoChoicesViewController: UIViewController {
    
    var completion: ((Int) -> Void)?

    @IBOutlet weak var decisionTextView: UITextView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func firstChoiceButton(_ sender: UIButton) {
        completion?(0)
    }
    
    @IBAction func secondChoiceButton(_ sender: UIButton) {
        completion?(1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        refreshView()
    }
    
    func refreshView() {
        let currentDecisionList = GameManager.shared.decisionsList[GameManager.shared.control]!
        decisionTextView.text = currentDecisionList.question
        firstButton.setTitle(currentDecisionList.choicesLabel[0], for: .normal)
        secondButton.setTitle(currentDecisionList.choicesLabel[1], for: .normal)
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
