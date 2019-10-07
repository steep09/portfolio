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
    
    @IBOutlet weak var mapView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.layer.masksToBounds = false
        mapView.layer.shadowOpacity = 1
        mapView.layer.shadowRadius = 5
        mapView.layer.shadowOffset = .zero
        mapView.layer.borderWidth = 5
        mapView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
}
