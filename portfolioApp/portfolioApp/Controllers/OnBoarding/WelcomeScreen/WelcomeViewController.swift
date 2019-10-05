//
//  WelcomeViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeBtn.buttonUI()
    }
    
    @IBAction func welcomeBtnWasPressed(_ sender: Any) {
        guard let signIn = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        self.present(signIn, animated: true) {
            
        }
        
    }

}
