//
//  SignUpViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var signUpBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageProfile.layer.cornerRadius = 50.0
        imageBtn.layer.cornerRadius = 50.0
        signUpBtn.buttonUI()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
