//
//  ActiveRunViewController.swift
//  Run Tracker
//
//  Created by Michael Leo on 11/9/21.
//

import UIKit
import CoreMotion

class ActiveRunViewController: UIViewController {

    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    let pedometer = CMPedometer()
    fileprivate var distance:Double! = 0.0
    fileprivate var pace:Double! = 0.0
    
    var isDistanceAvailable : Bool {
        get { return CMPedometer.isDistanceAvailable() }
    }
    var isPaceAvailable : Bool {
        get { return CMPedometer.isPaceAvailable() }
    }
    
    @IBOutlet weak var timeElapsedBox: UIView!
    @IBOutlet weak var distanceBox: UIView!
    @IBOutlet weak var averagePaceBox: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var secondsCounter: UILabel!
    @IBOutlet weak var mileCounter: UILabel!
    @IBOutlet weak var avgPace: UILabel!
    
    @objc func UpdateTimer() {
        counter += 0.1
        secondsCounter.text = String(format:"%02i:%02i:%02i", Int(counter) / 3600, Int(counter) / 60 % 60, Int(counter) % 60)
    }
    
    private func setPedometerData(pedData: CMPedometerData) {
        if let distance = pedData.distance{
            self.distance = Double(truncating: distance)
        }
    }
        
    @IBAction func onStart(_ sender: Any) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
            
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        
        // TODO: Start Run button causes crash because of the following lines... fix it
        
//        pedometer.startUpdates(from: Date()) { (pedometerData, error) in
//            if let pedData = pedometerData {
//                 self.setPedometerData(pedData: pedData)
//
//                if let currentPace = pedData.currentPace {
//                   self.pace = Double(truncating: currentPace)
//                }
//            }
//        }
    }
    
    @IBAction func onPause(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
            
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func onStop(_ sender: Any) {
        startButton.isEnabled = false
        pauseButton.isEnabled = false
            
        timer.invalidate()
        isPlaying = false
        secondsCounter.text = String(format:"%02i:%02i:%02i", Int(counter) / 3600, Int(counter) / 60 % 60, Int(counter) % 60)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeElapsedBox.layer.cornerRadius = 20
        distanceBox.layer.cornerRadius = 20
        averagePaceBox.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
        pauseButton.layer.cornerRadius = 20
        finishButton.layer.cornerRadius = 20
        
        secondsCounter.text = String(counter)
        pauseButton.isEnabled = false
        
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
