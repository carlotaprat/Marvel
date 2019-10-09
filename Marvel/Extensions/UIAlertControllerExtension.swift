//
//  UIAlertControllerExtension.swift
//  Marvel
//
//  Created by José Luis on 09/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.tintColor = UIColor.MarvelRed
     }
    
     static func generalAlert(error: MarvelError) -> UIAlertController {
        
        var title = ""
        var message = ""
        switch error {
        case .internalError:
            title = "internal_error_title".localized
            message = "internal_error_description".localized
            
        default:
            title = "general_error_title".localized
            message = "general_error_description".localized
        }
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "ok_dialog".localized,
                                                style: .cancel,
                                                handler: nil))
        
        return alertController
        
    }
    
    static func serviceAlert(viewController: UIViewController) -> UIAlertController {
        
        let alertController = UIAlertController(title: "service_error_title".localized,
                                                       message: "service_error_description".localized,
                                                       preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok_dialog".localized, style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        guard let delegate = viewController as? ServiceAlertProtocol else {
            return alertController
        }
        
        let retryAction = UIAlertAction(title: "retry_dialog".localized,
                                   style: .default) { (action) in
                                    delegate.reload()
        }
        
        alertController.addAction(retryAction)
        
        return alertController
        
    }
    
}
