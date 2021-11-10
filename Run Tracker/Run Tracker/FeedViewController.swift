//
//  FeedViewController.swift
//  Run Tracker
//
//  Created by Grace Brill on 11/6/21.
//

import UIKit
import Parse
import MapKit
class FeedViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var timeElapsed: UIView!
    @IBOutlet weak var distanceTraveled: UIView!
    @IBOutlet weak var averagePace: UIView!
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeElapsed.layer.cornerRadius = 20
        distanceTraveled.layer.cornerRadius = 20
        averagePace.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }

    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "Login Screen")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
        

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
