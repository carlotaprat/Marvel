//
//  HeroesListViewController.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import UIKit
import RxSwift

class CharactersListViewController: UIViewController {

    @IBOutlet weak var searchBar: CustomSearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: CharactersListViewModel = CharactersListViewModel()
    let apiService: CharactersDatabaseService = CharactersAPIService()
        
    
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let itemsPerRow = CGFloat(3.0)
        let itemsInset = CGFloat(10.0)
        let width = (UIScreen.main.bounds.size.width - ((itemsPerRow + 1) * itemsInset)) / 3
        layout.itemSize = CGSize(width: width, height: 200)
        layout.sectionInset = UIEdgeInsets(top: itemsInset, left: itemsInset, bottom: itemsInset, right: itemsInset)
        layout.minimumInteritemSpacing = 0.0
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchCharacters()

    }
    
    func setup() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.collectionViewLayout = layout
                
    }
    
    func fetchCharacters() {
        
        viewModel.fetchCharacters { _ in
            if self.viewModel.characters.count != 0 {
                self.collectionView.reloadData()
            }
        }
    }
    
   /* func searchCharacters() {
        
        let characters = viewModel.fetchCharacters()
        characters.subscribe(onNext: { (character) in
            
            // self.characters.append(character)
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
            if self.viewModel.characters.count != 0 {
                self.collectionView.reloadData()
            }
            
        }).disposed(by: disposeBag)
        
    }*/
    

}
