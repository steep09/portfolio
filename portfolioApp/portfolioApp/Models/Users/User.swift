//
//  User.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 05/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import Foundation

struct User {
    
    var firstName: String?
    var lastName: String?
    var countryCode: String?
    var mobileNumber: String?
    var emailAddress: String
    var profileImage: String?
    
    init(firstName: String, lastName: String, countryCode: String, mobileNumber: String, emailAddress: String, profileImage: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.countryCode = countryCode
        self.mobileNumber = mobileNumber
        self.emailAddress = emailAddress
        self.profileImage = profileImage
    }
    
    func completeMobileNumber() -> String {
        return "\(countryCode)\(mobileNumber)"
    }
    
}
