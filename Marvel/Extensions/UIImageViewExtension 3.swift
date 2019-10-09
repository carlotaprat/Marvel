//
//  UIImageViewExtension.swift
//  Marvel
//
//  Created by José Luis on 08/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func lowerShadow() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.frame.height)
        gradient.colors = [UIColor.black.withAlphaComponent(0.3).cgColor, UIColor.black.cgColor]
        self.layer.addSublayer(gradient)
    }
    
}
