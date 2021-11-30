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
    var dist = 0.0
    var averagePace = 0.0
    
    var timer = Timer()
    var pedDataClock = Timer()
    
    var isPlaying = false
    var isFirstTimeRunningonStart = true
    
    let TIMER_UPDATE_INTERVAL = 0.1
    
    let pedometer = CMPedometer()
    
    var startTime: Date? = nil
    
    @IBOutlet weak var timeElapsedBox: UIView!
    @IBOutlet weak var distanceBox: UIView!
    @IBOutlet weak var averagePaceBox: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var secondsCounter: UILabel!
    @IBOutlet weak var mileCounter: UILabel!
    @IBOutlet weak var avgPace: UILabel!
    
    struct DefaultsKeys {
        static let time = "time"
        static let distance = "distance"
        static let pace = "averagePace"
    }
    
    
    private func pedometerIsAvailable() -> Bool {
        return CMPedometer.authorizationStatus() == .authorized && CMPedometer.isDistanceAvailable() && CMPedometer.isPaceAvailable()
    }
    
    private func handleData(data: CMPedometerData) {
        if let distInMeters = data.distance {
            let distanceInMeters = Measurement(value: distInMeters as! Double, unit: UnitLength.meters)
            dist = distanceInMeters.converted(to: .miles).value
            DispatchQueue.main.async { // we get a thread error without wrapping with this lol
                self.mileCounter.text = String(format: "%.2f miles", self.dist)
            }
            // distance calculated and displayed at this point
        }
        
        if let avgActivePace = data.averageActivePace {
            let averagePaceInMetersPerSecond = Measurement(value: 1 / (avgActivePace as! Double), unit: UnitSpeed.metersPerSecond) // pedometerData supplies us with a value in seconds per meter, so we take the reciprocal of that to convert it to metersPerSecond
            averagePace = averagePaceInMetersPerSecond.converted(to: .milesPerHour).value
            DispatchQueue.main.async { // we get a thread error without wrapping with this lol
                self.avgPace.text = String(format: "%.2f MPH", self.averagePace)
            }
            // average pace calculated and displayed at this point
        }
    }
    
    @objc func UpdatePedData() {
        if self.pedometerIsAvailable() {
            pedometer.queryPedometerData(from: startTime!, to: Date(), withHandler: { (data, error) in
                if let pedometerData = data {
                    self.handleData(data: pedometerData)
                } else {
                    print(error!.localizedDescription)
                }
            })
        } else {
            print("Something went wrong:")
            print("CMPedometer.authorizationStatus() == .authorized -> \(CMPedometer.authorizationStatus() == .authorized)")
            print("CMPedometer.isDistanceAvailable() -> \(CMPedometer.isDistanceAvailable())")
            print("CMPedometer.isPaceAvailable() -> \(CMPedometer.isPaceAvailable())")
        }
    }
    
    
    @objc func UpdateTimer() {
        counter += TIMER_UPDATE_INTERVAL
        secondsCounter.text = String(format:"%02i:%02i:%02i", Int(counter) / 3600, Int(counter) / 60 % 60, Int(counter) % 60)
    }
    
    
    @IBAction func onStart(_ sender: Any) {
        if isPlaying {
            return
        }
        if isFirstTimeRunningonStart { // this block runs only once every time user starts a new run
            startTime = Date()
            isFirstTimeRunningonStart = false
        }
        
        // disable FeedViewController tab until user ends the run
        if let arrayOfTabBarItems = tabBarController?.tabBar.items {
            arrayOfTabBarItems[0].isEnabled = false
        }
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        finishButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: TIMER_UPDATE_INTERVAL, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true) // increment time elapsed
        pedDataClock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdatePedData), userInfo: nil, repeats: true) // update distance/avgPace
        
        isPlaying = true
    }
    
    @IBAction func onPause(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        finishButton.isEnabled = true
            
        timer.invalidate()
        pedDataClock.invalidate()
        isPlaying = false
    }
    
    @IBAction func onStop(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        finishButton.isEnabled = false
            
        timer.invalidate()
        pedDataClock.invalidate()
        isPlaying = false
        isFirstTimeRunningonStart = true
        
        pedometer.stopUpdates()
        
        
        // store data from this run for display in FeedViewController
        let defaults = UserDefaults.standard
        defaults.set(counter, forKey: DefaultsKeys.time)
        defaults.set(dist, forKey: DefaultsKeys.distance)
        defaults.set(averagePace, forKey: DefaultsKeys.pace)
        
        // re-enable FeedViewController tab
        if let arrayOfTabBarItems = tabBarController?.tabBar.items {
            arrayOfTabBarItems[0].isEnabled = true
        }
        
        // go to FeedViewController
        tabBarController?.selectedIndex = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeElapsedBox.layer.cornerRadius = 20
        distanceBox.layer.cornerRadius = 20
        averagePaceBox.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
        pauseButton.layer.cornerRadius = 20
        finishButton.layer.cornerRadius = 20
        
        pauseButton.isEnabled = false
        finishButton.isEnabled = false
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // reset text values
        DispatchQueue.main.async { // we get a thread error without wrapping with this lol
            self.secondsCounter.text = "00:00:00"
            self.mileCounter.text = "0.00 miles"
            self.avgPace.text = "0.00 MPH"
        }
        
        startTime = nil
        
        counter = 0.0
        dist = 0.0
        averagePace = 0.0
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
