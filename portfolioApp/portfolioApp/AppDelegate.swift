//
//  AppDelegate.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //This API Key is for GoogleMaps pod.
        // here is the link https://developers.google.com/maps/documentation/ios-sdk/views
        GMSServices.provideAPIKey("AIzaSyBpswBL_Owef-P5PvubLf2N2R9FNogWwqs")
        
        if Auth.auth().currentUser == nil {
            print("No Current User")
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let WelcomeView = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
            window?.makeKeyAndVisible()
            window?.rootViewController?.present(WelcomeView, animated: true, completion: nil)
        } else {
            print("User Currently Logged In")
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

