//
//  UIView.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 10/15/19.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

extension UIView {
    
    func viewLayout() {
        let view = self
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = .zero
        view.layer.borderWidth = 5
        view.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
