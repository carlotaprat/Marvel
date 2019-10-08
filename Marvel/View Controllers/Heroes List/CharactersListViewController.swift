//
//  HeroesListViewController.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController {

    @IBOutlet weak var searchBar: CustomSearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noResultsView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CharactersListViewModel = CharactersListViewModel()
    let apiService: CharactersDatabaseService = CharactersAPIService()
    
    var searchText: String = ""
    var refreshController = UIRefreshControl()
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let itemsPerRow = CGFloat(3.0)
        let itemsInset = CGFloat(10.0)
        let width = (UIScreen.main.bounds.size.width - ((itemsPerRow + 1) * itemsInset)) / 3
        layout.itemSize = CGSize(width: width, height: 2 * width)
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
        
        refreshController.tintColor = UIColor.MarvelDark
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.refreshControl = refreshController
        
        self.searchText = searchBar.text ?? ""
        
        searchBar.delegate = self as! UISearchBarDelegate
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    func fetchCharacters() {
        if !refreshController.isRefreshing {
            activityIndicator.isHidden = true
        } else {
            activityIndicator.isHidden = false
        }
        viewModel.fetchCharacters(searchText: searchText) { _ in
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
            self.refreshController.endRefreshing()
            self.activityIndicator.isHidden = true
            if self.viewModel.getCharactersCount() == 0 {
                self.noResultsView.isHidden = false
            } else {
                self.noResultsView.isHidden = true
            }
        }
    }
    
    @objc func reload() {
        viewModel.resetPagination()
        self.searchText = searchBar.text ?? ""
        self.fetchCharacters()
    }
    
    @objc func refresh() {
        viewModel.resetPagination()
        collectionView.reloadData()
        self.searchText = ""
        self.fetchCharacters()
    }
    
    @objc func hideKeyboard() {
        self.searchBar.endEditing(true)

    }

}
