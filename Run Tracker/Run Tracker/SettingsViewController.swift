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
    @IBOutlet weak var passwordBox: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var confirmPasswordBox: UIView!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    var user = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameBox.layer.cornerRadius = 20
        emailBox.layer.cornerRadius = 20
        passwordBox.layer.cornerRadius = 20
        confirmPasswordBox.layer.cornerRadius = 20
        
        //Retrieve user info
        usernameTextfield.text = user?.username
        emailTextfield.text = user?.email
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Password changer not working!
    @IBAction func updateAccountInfo(_ sender: Any) {
        user?.username = usernameTextfield.text!
        user?.email = emailTextfield.text!
        
        
        user?.saveInBackground(block: { success, error in
            if error != nil{
                print("Error: \(String(describing: error))")
            }
            else{
                print("Settings updated!")
            }
        })
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
