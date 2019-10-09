//
//  CustomSearchBar.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation
import UIKit

class CustomSearchBar: UISearchBar {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.searchTextField.textColor = UIColor.MarvelWhite
        self.searchTextField.clearButtonMode = .whileEditing
        self.setImage(UIImage(named: "lupa"), for: .search, state: .normal)
    }
    
}
