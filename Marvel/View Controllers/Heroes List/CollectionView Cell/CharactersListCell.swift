

import UIKit
import Alamofire

class CharactersListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupCell(character: Character) {
        nameLabel.text = character.name
        
    }
  /*  func setupWithHero(hero: Hero) {
        imageView.image = UIImage()
        nameLabel.text = hero.name
    } */
}
