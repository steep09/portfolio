//
//  SignInViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var emailAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    var user = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        passwordTxtField.isSecureTextEntry = true
        signInBtn.buttonUI()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        
        if emailAddressTxtField.text != nil && passwordTxtField.text != nil {
        //            user.loginUser(withEmail: emailAddressTxtField.text!, andPassword: passwordTxtField.text!)
            Auth.auth().signIn(withEmail: emailAddressTxtField.text!, password: passwordTxtField.text!) { (result, error) in
                if error != nil {
                    print("ERROR: \(error)")
                } else {
                    guard let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeTab") as? UITabBarController else { return }
                    homeView.modalPresentationStyle = .overCurrentContext
                    homeView.definesPresentationContext = true
                    self.show(homeView, sender: self)
                    print("BUTTON PRESSED")
                    self.emailAddressTxtField.text = ""
                    self.passwordTxtField.text = ""
                }
            }
        } else {
            print("PLEASE INPUT EMAIL AND PASSWORD")
        }
    }
    
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        guard let signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        signUp.modalPresentationStyle = .fullScreen
        self.present(signUp, animated: true, completion: nil)
    }

}
