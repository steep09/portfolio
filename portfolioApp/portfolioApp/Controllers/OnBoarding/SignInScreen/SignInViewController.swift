//
//  SignInViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        signInBtn.buttonUI()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        guard let signUp = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        self.present(signUp, animated: true, completion: nil)
    }

}
