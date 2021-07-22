import UIKit

class FirstDecisionViewController: UIViewController {
    
    @IBOutlet var FirstDecisionView: UIView!
    
    @IBAction func ConservadorChoice(_ sender: UIButton) {
        GameSingleton.sharedVariables.perfilInvestidor = .conservador
        FirstDecisionView.isHidden = true
    }
    
    @IBAction func ModeradoChoice(_ sender: UIButton) {
        GameSingleton.sharedVariables.perfilInvestidor = .moderado
        FirstDecisionView.removeFromSuperview()
    }
    
    @IBAction func AgressivoChoice(_ sender: UIButton) {
        GameSingleton.sharedVariables.perfilInvestidor = .agressivo
        FirstDecisionView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
