//
//  locationTrackerMainViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 10/13/19.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class locationTrackerMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func locationTrackerBtnWasPressed(_ sender: Any) {
        
        guard let locationTracker = self.storyboard?.instantiateViewController(withIdentifier: "locationTrackerViewController") else { return }
        locationTracker.modalPresentationStyle = .fullScreen
        self.present(locationTracker, animated: true)
        print("BUTTON PRESSED")
    }

}
