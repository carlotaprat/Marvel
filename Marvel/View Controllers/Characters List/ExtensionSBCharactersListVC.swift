import Foundation
import UIKit

extension CharactersListViewController: UISearchBarDelegate {
    
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(reload), object: nil)
        self.perform(#selector(reload), with: nil, afterDelay: delayFetchOnSearch)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.hideKeyboard()
    }
    
}
