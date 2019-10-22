//
//  ProfileModel.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 10/22/19.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import Foundation

class ProfileModel {
    
    var viewController: ProfileViewController?
    
    init(model: ProfileModel) {
        self.viewController?.model = self
    }
}
