//
//  APIUrls.swift
//  Marvel
//
//  Created by José Luis on 09/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

enum APIUrls: String {
    
    case characters = "characters"
    
    var getUrl: String {
        return "http://gateway.marvel.com/v1/public/\(self.rawValue)"
    }
}
