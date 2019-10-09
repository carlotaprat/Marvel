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
