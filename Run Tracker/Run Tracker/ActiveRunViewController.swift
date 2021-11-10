//
//  ActiveRunViewController.swift
//  Run Tracker
//
//  Created by Michael Leo on 11/9/21.
//

import UIKit

class ActiveRunViewController: UIViewController {

    
    @IBOutlet weak var timeElapsedBox: UIView!
    @IBOutlet weak var distanceBox: UIView!
    @IBOutlet weak var averagePaceBox: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeElapsedBox.layer.cornerRadius = 20
        distanceBox.layer.cornerRadius = 20
        averagePaceBox.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
        finishButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
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
