

import UIKit
import Alamofire
import Kingfisher

class CharactersListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupCell(character: Character) {
        nameLabel.text = character.name
        if let url = URL(string: character.picture?.urlPortrait ?? "") {
            imageView.kf.setImage(with: url)

        }
    }
}
