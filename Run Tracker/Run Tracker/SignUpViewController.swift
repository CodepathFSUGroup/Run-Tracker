//
//  SignUpViewController.swift
//  Run Tracker
//
//  Created by Grace Brill on 11/6/21.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreation(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        user.signUpInBackground { (success, failure) in
            if success{
                self.performSegue(withIdentifier: "createAccount", sender: nil)
            }
            
            else{
                print("Error \(failure?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "cancelToLogin", sender: nil)
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
