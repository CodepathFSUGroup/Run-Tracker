//
//  SettingsViewController.swift
//  Run Tracker
//
//  Created by Michael Leo on 11/17/21.
//

import UIKit
import Parse
import Alamofire
class SettingsViewController: UIViewController {

    @IBOutlet weak var usernameBox: UIView!
    @IBOutlet weak var emailBox: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    

    
    var user = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameBox.layer.cornerRadius = 20
        emailBox.layer.cornerRadius = 20
        resetPasswordButton.layer.cornerRadius = 20
        saveChangesButton.layer.cornerRadius = 20
        
        //Retrieve user info
        usernameTextfield.text = user?.username
        emailTextfield.text = user?.email
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPasswordReset(_ sender: Any) {
        PFUser.requestPasswordResetForEmail(inBackground: (user?.email)!) { success, error in
            if error != nil{
                print(error)
            }else{
                let alert = UIAlertController(title: "Password Reset Email Sent!", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
                NSLog("update account")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func updateAccountInfo(_ sender: Any) {
        user?.username = usernameTextfield.text!
        user?.email = emailTextfield.text!
        
        user?.saveInBackground(block: { success, error in
            if error != nil{
                print("Error: \(String(describing: error))")
            }
            else{
                let alert = UIAlertController(title: "Account information updated!", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
                NSLog("password email")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
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
