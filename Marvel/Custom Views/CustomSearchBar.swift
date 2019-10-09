import Foundation
import UIKit

class CustomSearchBar: UISearchBar {
    
    let lupaImgName = "lupa"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.searchTextField.textColor = UIColor.MarvelWhite
        self.searchTextField.clearButtonMode = .whileEditing
        self.setImage(UIImage(named: lupaImgName), for: .search, state: .normal)
    }
    
}
