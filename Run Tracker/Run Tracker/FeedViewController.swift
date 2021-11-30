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
        
    
    @IBOutlet weak var secondCounter: UILabel!
    @IBOutlet weak var mileCounter: UILabel!
    @IBOutlet weak var avgPace: UILabel!
    
    
    struct DefaultsKeys {
        static let time = "time"
        static let distance = "distance"
        static let pace = "averagePace"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeElapsed.layer.cornerRadius = 20
        distanceTraveled.layer.cornerRadius = 20
        averagePace.layer.cornerRadius = 20
     
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // get stored data from last run
        let defaults = UserDefaults.standard
        
        let t = defaults.double(forKey: DefaultsKeys.time)
        secondCounter.text = String(format: "%02i:%02i:%02i", Int(t) / 3600, Int(t) / 60 % 60, Int(t) % 60)
        mileCounter.text = String(format: "%.2f miles", defaults.double(forKey: DefaultsKeys.distance))
        avgPace.text = String(format: "%.2f MPH", defaults.double(forKey: DefaultsKeys.pace))
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
