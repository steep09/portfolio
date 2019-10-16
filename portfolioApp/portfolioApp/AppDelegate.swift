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
        GMSServices.provideAPIKey("AIzaSyDIfH4IfCw4ST6sn7W9xylQx3ubgn2yo4k")
        
        print("NO CURRENT USER: \(Auth.auth().currentUser == nil)")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        
//        if Auth.auth().currentUser == nil {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let welcomeVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
//            window?.rootViewController?.present(welcomeVC, animated: true, completion: nil)
//        } else {
//            print("Hello \(Auth.auth().currentUser?.email ?? "")")
//        }
        
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

