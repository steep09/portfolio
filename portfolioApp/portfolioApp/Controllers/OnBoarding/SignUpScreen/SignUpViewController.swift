//
//  SignUpViewController.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

var countryCodeString: String?

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
    
    var countryListVC: CountryListViewController?
    
    var sample: Int = 0

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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.countryListVC?.signUpVC = self
        
        self.sample += 1
        
        self.countryCodeBtn.setTitle("\(countryCodeString ?? "+63")", for: .normal)
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageBtnWasPressed(_ sender: Any) {
        
        print("Image Button was pressed")
        
        imageBtn.isHidden = true
        imageProfile.isHidden = false
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func countryCodeBtnWasPressed(_ sender: Any) {
        guard let countryView = self.storyboard?.instantiateViewController(withIdentifier: "CountryListViewController") as? CountryListViewController else { return }
        countryView.modalPresentationStyle = .fullScreen
        self.show(countryView, sender: self)
    }
    
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        
        print("Sign Up Button Was Pressed")
        
        let user = User(firstName: firstNameTxtField.text ?? "",
                        lastName: lastNameTxtField.text ?? "",
                        countryCode: countryCodeString ?? "+63",
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
                    self.toastMessageView.showToastMessage(label: self.toastMessageTxt, message: "Password must contain at least 6 characters")
                    print("Password must contain at least 6 characters")
                }
            } else {
                self.toastMessageView.showToastMessage(label: self.toastMessageTxt, message: "The format of your email is wrong")
                print("The format of your email is wrong")
            }
        } else {
            self.toastMessageView.showToastMessage(label: self.toastMessageTxt, message: "PLEASE FILL UP ALL TEXTFIELDS")
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
