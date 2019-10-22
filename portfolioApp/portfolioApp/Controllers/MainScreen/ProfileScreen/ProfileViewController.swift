//
//  profileViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 10/22/19.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userContactNumber: UILabel!
    @IBOutlet weak var userEmailAddress: UILabel!
    @IBOutlet weak var userPassword: UILabel!
    
    var model: ProfileModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
