

import UIKit
import Alamofire
import Kingfisher

class CharactersListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: CharacterListCellViewModel = CharacterListCellViewModel()
    
    func setupCell() {
        
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.MarvelDark.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 5
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

        nameLabel.text = viewModel.getCharacterName()
        if let url = URL(string: viewModel.getPicturePortrait()) {
            imageView.kf.setImage(with: url)
        }
    }
}
