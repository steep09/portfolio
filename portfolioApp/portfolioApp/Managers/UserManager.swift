//
//  UserManager.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 06/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserManager {
    
    func loginUser(withEmail email: String, andPassword password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("ERROR: \(error)")
            }
        }
    }
    
    func createUser(withEmail email: String, andPassword password: String, users: User) {
        
        //Firebase Authentication for creating user
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("User hase been registered.")
                
                 //Create a document for user information in Firestore
                let user = [
                    "firstName": users.firstName ?? "",
                    "lastName": users.lastName ?? "",
                    "countryCode": users.countryCode ?? "",
                    "mobileNumber": users.mobileNumber ?? "",
                    "emailAddress": users.emailAddress ,
                    "profileImage": users.profileImage ?? ""
                ]
                
                Firestore.firestore().collection("users").document().setData(user) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                
            } else if error != nil {
                print("ERROR: \(error!)")
            }
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("ERROR: \(error)")
            }
        }
    }
    
}
