//
//  LoginViewController.swift
//  Run Tracker
//
//  Created by Grace Brill on 11/6/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
        
    @IBOutlet weak var usernameBox: UIView!
    @IBOutlet weak var passwordBox: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameBox.layer.cornerRadius = 20
        passwordBox.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
        loginButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, failure) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
            else{
                print("Error: \(failure?.localizedDescription)")
                
                let alert = UIAlertController(title: "Login Failed!", message: "Please check your information and try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Try Again", comment: "Default action"), style: .default, handler: { _ in
                NSLog("Login failed alert")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
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
