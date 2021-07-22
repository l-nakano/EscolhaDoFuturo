import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var FirstDecision: UIView!
    @IBOutlet weak var StoryLabel: UILabel!
    
    @IBAction func Next(_ sender: UIButton) {
        if GameSingleton.sharedVariables.decisionsList.keys.contains(GameSingleton.sharedVariables.textController) {
            FirstDecision.isHidden = false
        }
        StoryLabel.text = GameSingleton.sharedVariables.textsList[GameSingleton.sharedVariables.textController]
        GameSingleton.sharedVariables.textController += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
