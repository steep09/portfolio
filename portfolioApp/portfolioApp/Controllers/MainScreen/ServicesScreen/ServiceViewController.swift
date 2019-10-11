//
//  ServiceViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func locationTrackerBtnWasPressed(_ sender: Any) {
        
        guard let locationTracker = self.storyboard?.instantiateViewController(withIdentifier: "locationTrackerViewController") as? UIViewController else { return }
        locationTracker.modalPresentationStyle = .fullScreen
        self.present(locationTracker, animated: true)
        print("BUTTON PRESSED")
    }
}
