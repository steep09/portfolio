//
//  WelcomeViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeBtn.buttonUI()
        
        
    }
    
    @IBAction func welcomeBtnWasPressed(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            guard let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeTab") as? UITabBarController else { return }
            homeView.modalPresentationStyle = .overCurrentContext
            homeView.definesPresentationContext = true
            self.show(homeView, sender: self)
        } else {
            guard let signIn = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
            signIn.modalPresentationStyle = .fullScreen
            self.present(signIn, animated: true) {
                
            }
        }
        
        
    }

}
