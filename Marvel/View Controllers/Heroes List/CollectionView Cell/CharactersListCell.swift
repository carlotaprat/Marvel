

import UIKit
import Alamofire
import Kingfisher

class CharactersListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupCell(character: Character) {
        nameLabel.text = character.name
        if let url = URL(string: character.imgPortrait?.url ?? "") {
            imageView.kf.setImage(with: url)

        }
        // imageView.image = UIImage(na)
    }
  /*  func setupWithHero(hero: Hero) {
        imageView.image = UIImage()
        nameLabel.text = hero.name
    } */
}
