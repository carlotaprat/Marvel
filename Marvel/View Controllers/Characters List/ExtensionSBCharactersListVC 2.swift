//
//  ExtensionSBCharactersListVC.swift
//  Marvel
//
//  Created by José Luis on 08/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation
import UIKit

extension CharactersListViewController: UISearchBarDelegate {
    
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(reload), object: nil)
        self.perform(#selector(reload), with: nil, afterDelay: 0.5)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.hideKeyboard()
    }
    
}
