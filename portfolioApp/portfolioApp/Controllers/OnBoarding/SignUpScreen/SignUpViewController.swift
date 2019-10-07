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
    
    @IBOutlet weak var toastMessageView: UIView!
    @IBOutlet weak var toastMessageTxt: UILabel!
    
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var contactNumberTxtField: UITextField!
    @IBOutlet weak var emailAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    var userManager = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self

        countryCodeBtn.layer.cornerRadius = 5.0
        
        imageProfile.layer.cornerRadius = 50.0
        imageBtn.layer.cornerRadius = 50.0
        signUpBtn.buttonUI()
        
        toastMessageView.layer.cornerRadius = 10.0
        
        passwordTxtField.isSecureTextEntry = true
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageBtnWasPressed(_ sender: Any) {
        
        print("Image Button was pressed")
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        
        print("Sign Up Button Was Pressed")
        
        let user = User(firstName: firstNameTxtField.text ?? "",
                        lastName: lastNameTxtField.text ?? "",
                        countryCode: "",
                        mobileNumber: contactNumberTxtField.text ?? "",
                        emailAddress: emailAddressTxtField.text ?? "",
                        profileImage: "")
        
        print(firstNameTxtField.text ?? "")
        print(lastNameTxtField.text ?? "")
        print(contactNumberTxtField.text ?? "")
        print(emailAddressTxtField.text ?? "")
        
        if emailAddressTxtField.text != "" && passwordTxtField.text != "" && firstNameTxtField.text != "" && lastNameTxtField.text != "" && contactNumberTxtField.text != "" {
            if (emailAddressTxtField.text?.contains("@"))! && (emailAddressTxtField.text?.contains("."))! {
                if passwordTxtField.text!.count > 5 {
                    print("Creating User")
                    
                    self.userManager.createUser(withEmail: emailAddressTxtField.text!, andPassword: passwordTxtField.text!, users: user)
                } else {
                    self.toastMessageTxt.text = "Password must contain at least 6 characters"
                    self.toastMessageView.showToastMessage(message: "Password must contain at least 6 characters")
                    print("Password must contain at least 6 characters")
                }
            } else {
                self.toastMessageTxt.text = "The format of your email is wrong"
                self.toastMessageView.showToastMessage(message: "The format of your email is wrong")
                print("The format of your email is wrong")
            }
        } else {
            self.toastMessageTxt.text = "PLEASE FILL UP ALL TEXTFIELDS"
            self.toastMessageView.showToastMessage(message: "PLEASE FILL UP ALL TEXTFIELDS")
            print("PLEASE FILL UP ALL TEXTFIELDS")
        }
        
    }

}

extension SignUpViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey :
    Any]) {
        
        self.imageProfile.isHidden = false
//        self.imageBtn.isHidden = false
        
        if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageProfile.image = img
            self.dismiss(animated: true, completion: nil)
        } else {
            print("error")
        }
    }
}
