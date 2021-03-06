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
    
    @IBOutlet weak var createUsernameBox: UIView!
    @IBOutlet weak var enterEmailBox: UIView!
    @IBOutlet weak var enterPasswordBox: UIView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUsernameBox.layer.cornerRadius = 20
        enterEmailBox.layer.cornerRadius = 20
        enterPasswordBox.layer.cornerRadius = 20

        createAccountButton.layer.cornerRadius = 20
        createAccountButton.clipsToBounds = true

        cancelButton.layer.cornerRadius = 20
        cancelButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreation(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text!
        user.password = passwordField.text!
        user.email = emailField.text!
        
        user.signUpInBackground { (success, failure) in
            if success{
                self.dismiss(animated: true, completion: nil)
                
                let alert = UIAlertController(title: "Account created!", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
                NSLog("Created account alert")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
            else{
                print("Error \(failure?.localizedDescription)")
                
                let alert = UIAlertController(title: "Signup Failed!", message: "Please check your information and try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Try Again", comment: "Default action"), style: .default, handler: { _ in
                NSLog("Signup failed alert")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissKeyboardTap(_ sender: Any) {
        view.endEditing(true)
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
