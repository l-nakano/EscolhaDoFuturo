//
//  InitialScreenViewController.swift
//  EscolhaDoFuturo
//
//  Created by Lucas Yoshio Nakano on 25/07/21.
//

import UIKit

class InitialScreenViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.blink()
    }
    
    @IBAction func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        if let vc = storyboard?.instantiateViewController(identifier: "Game") {
            show(vc, sender: self)
        }
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
