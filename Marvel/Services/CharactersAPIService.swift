//
//  HeroesAPIService.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation
import Alamofire

protocol CharactersDatabaseService {
    
    func fetchCharacters(offset: Int, search: String?, onSuccess: @escaping (_ response: PaginatedCharacters?) -> Void, onError: @escaping (_ error: MarvelError) -> Void)
}

struct CharactersAPIService: APIProtocol, CharactersDatabaseService {
    
    func paginationParameters(offset: Int) {
        
    }
    
    
    func md5() {
        
    }
    
    func getTimestamp() {
        
    }
    

    func fetchCharacters(offset: Int, search: String?, onSuccess: @escaping(_ pagination: PaginatedCharacters?) -> Void, onError: @escaping (_ error: MarvelError) -> Void) {
        
        let url = String(format: getUrl(url: .characters))
        var params = self.paginationParameters(offset: offset) as Parameters
        
        if let searchText = search {
            params["nameStartsWith"] = searchText
        }
        
        AF.request(url, method: .get, parameters: params)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        onError(.internalError)
                        return
                    }
                    
                    do {
                        let request = try JSONDecoder().decode(Response.self, from: data)
                        onSuccess(request.data)
                        
                    } catch {
                        onError(.internalError)
                    }
                    
                case .failure:
                    onError(.serviceError)
                }
        }
        
    }
    
    
    

    
    
    
}
