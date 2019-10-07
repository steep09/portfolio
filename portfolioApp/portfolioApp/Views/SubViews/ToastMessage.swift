//
//  ToastMessage.swift
//  portfolioApp
//
//  Created by Stephenson Ang on 07/10/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import UIKit

extension UIView {
    
    func showToastMessage(message: String) {
        self.isHidden = false
        self.layer.opacity = 1.0
        closeToastMessageAnimation()
    }
    
    func closeToastMessageAnimation() {
        
        UIView.animate(withDuration: 0.5,
                       delay: 1.5,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        
                        guard let this = self else { return }
                        
                        this.layer.opacity = 0.0
                        
        }) { [weak self] _ in
            
            guard let this = self else { return }
            
//            this.removeFromSuperview()
            this.isHidden = true
        }
        
    }
}
