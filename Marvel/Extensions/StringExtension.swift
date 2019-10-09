//
//  StringExtension.swift
//  Marvel
//
//  Created by José Luis on 09/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
