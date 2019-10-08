//
//  ExtensionHeroesListViewController.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation
import UIKit

extension CharactersListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getCharactersCount()
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
        
        cell.setupCell(character: character)
        
        return cell
    }
    
    
    
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
    }*/
    
    
    
    
    
    
}
