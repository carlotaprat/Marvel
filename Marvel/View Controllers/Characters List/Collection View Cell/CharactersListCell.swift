

import UIKit
import Alamofire
import Kingfisher

class CharactersListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: CharacterListCellViewModel = CharacterListCellViewModel()
    
    func setupCell() {
        nameLabel.text = viewModel.getCharacterName()
        if let url = URL(string: viewModel.getPicturePortrait()) {
            imageView.kf.setImage(with: url)
        }
    }
}
