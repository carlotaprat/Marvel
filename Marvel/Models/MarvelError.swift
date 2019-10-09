//
//  MarvelError.swift
//  Marvel
//
//  Created by José Luis on 09/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

enum MarvelError {
    case serviceError
    case generalError
    case internalError
}

/* class MarvelError {
    
    var title: String = ""
    var description: String = ""
    
    init(type: ErrorType) {
        switch type {
        case .serviceError:
            self.title = NSLocalizedString("service_error_title", comment: "")
            self.description = NSLocalizedString("service_error_title", comment: "")

        case .generalError:
        case .internalError:
        }
        self.title = title
        self.description = description
    }
    
}*/
