//
//  HomeTabViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class HomeTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            guard let welcomeView = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") else { return }
            welcomeView.modalPresentationStyle = .fullScreen
            self.present(welcomeView, animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
}
