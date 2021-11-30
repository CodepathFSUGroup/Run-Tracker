//
//  AppDelegate.swift
//  Run Tracker
//
//  Created by Grace Brill on 11/6/21.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    struct DefaultsKeys {
        static let time = "time"
        static let distance = "distance"
        static let pace = "averagePace"
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "nM3c4WpxHWi74M6jmr6HQjf8zHpOADkbFjE1spd3" // <- UPDATE
                $0.clientKey = "9M1quEQ86WHWhCkmPZocwVzx4X5d63Q1AFVZlIJ0" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        // set default values - these sets will only be run once across all app launches
        let defaults = UserDefaults.standard
        
        if let t = defaults.object(forKey: DefaultsKeys.time) {
            // do nothing... value is already set
        } else {
            // if this code is running, it means t is nil, so it was never defined.
            // So let's give it a default value that will be overwritten when user makes first run:
            defaults.set(0.00, forKey: DefaultsKeys.time)
            
        }
        
        if let d = defaults.object(forKey: DefaultsKeys.distance) {
            // do nothing... value is already set
        } else {
            // if this code is running, it means d is nil, so it was never defined.
            // So let's give it a default value that will be overwritten when user makes first run:
            defaults.set(0.00, forKey: DefaultsKeys.distance)
            
        }
        
        if let p = defaults.object(forKey: DefaultsKeys.pace) {
            // do nothing... value is already set
        } else {
            // if this code is running, it means p is nil, so it was never defined.
            // So let's give it a default value that will be overwritten when user makes first run:
            defaults.set(0.00, forKey: DefaultsKeys.pace)
            
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    


}

