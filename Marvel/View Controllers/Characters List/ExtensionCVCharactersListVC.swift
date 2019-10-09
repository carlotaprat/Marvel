import Foundation
import UIKit

extension CharactersListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.viewModel.getCharactersCount() == 0 ? 0 : self.viewModel.getCharactersCount()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersListCell", for: indexPath) as? CharactersListCell else {
            return UICollectionViewCell()
        }
        guard let character = self.viewModel.getCharacter(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        let currentCharactersCount = viewModel.getCharactersCount()
        if currentCharactersCount < viewModel.getTotalCharacters() &&
            indexPath.row == (currentCharactersCount - 6) {
            self.fetchCharacters()
        }
        cell.viewModel.setCharacter(character: character)
        cell.setupCell()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailViewController {
            if let char = self.viewModel.getCharacter(index: indexPath.row) {
                vc.viewModel.setCharacter(character: char)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
