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
    //private var fetchInProgress = false
    
    func fetchCharacters(completionHandler: @escaping (Bool) -> Void) {
        
        dataService.fetchCharacters(page: currentPage, limit: limit) { response in
            
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
        
        
    }
    
    func getCharactersCount() -> Int {
        return characters.count
    }
    
    func getCharacter(index: Int) -> Character? {
        guard characters.count > index else {
            return nil
        }
        
        return characters[index]
    }
}
