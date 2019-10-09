

import UIKit
import Alamofire
import Kingfisher

class CharactersListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: CharacterListCellViewModel = CharacterListCellViewModel()
    
    let sizeShadow: CGFloat = 1
    let opacityShadow: CGFloat = 0.5
    let cornerRadius: CGFloat = 5
    
    func setupCell() {
        
        self.layer.shadowOffset = CGSize(width: sizeShadow, height: sizeShadow)
        self.layer.shadowColor = UIColor.MarvelDark.cgColor
        self.layer.shadowRadius = sizeShadow
        self.layer.shadowOpacity = Float(opacityShadow)
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = cornerRadius
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

        nameLabel.text = viewModel.getCharacterName()
        if let url = URL(string: viewModel.getPicturePortrait()) {
            imageView.kf.setImage(with: url)
        }
    }
}
