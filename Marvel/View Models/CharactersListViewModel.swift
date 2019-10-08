//
//  HeroesListViewModel.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

class CharactersListViewModel: ViewModel {
    
    var dataService: CharactersDatabaseService = CharactersAPIService()
    
    var characters: [Character] = []
    private var currentPage = 0
    private var total = 0
    private var limit = 0
    private var offset = 0
    
    var onSearch = false
    var searchingText = ""
    
    func resetPagination() {
        self.characters.removeAll()
        total = 0
        limit = 0
        offset = 0
    }
    
    func fetchCharacters(searchText: String?, completionHandler: @escaping (Bool) -> Void) {
        
        var text = searchText
        if text == "" {
            text = nil
        }
        dataService.fetchCharacters(offset: characters.count, search: text) { response in
            
            guard let paginatedCharacters = response else {
                completionHandler(false)
                return
            }
            
            self.currentPage += 1
            self.total = paginatedCharacters.total
            self.offset = paginatedCharacters.offset
            self.limit = paginatedCharacters.limit
            
            if self.currentPage == 1 {
                self.characters.removeAll()
            }
            self.characters.append(contentsOf: paginatedCharacters.results)
            
            completionHandler(true)
            
        }
        
    }
    
    /*func searchCharacters(searchText: String, completionHandler: @escaping (Bool) -> Void) {
        
        onSearch = true
        searchingText = searchText
        
        dataService.fetchCharacters(offset: characters.count, search: searchText) { response in
            
            guard let paginatedCharacters = response else {
                completionHandler(false)
                return
            }
            
            self.currentPage += 1
            //self.fetchInProgress = false
            self.total = paginatedCharacters.total
            self.offset = paginatedCharacters.offset
            self.limit = paginatedCharacters.limit
            
            if self.currentPage == 1 {
                self.characters.removeAll()
            }
            self.characters.append(contentsOf: paginatedCharacters.results)
            
            completionHandler(true)
            
        }
        
    }*/
    
   
    
    func getCharactersCount() -> Int {
        return characters.count
    }
    
    func getCharacter(index: Int) -> Character? {
        guard characters.count > index else {
            return nil
        }
        
        return characters[index]
    }
    
    func getTotalCharacters() -> Int {
        return total
    }
}
