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
    func fetchCharacters(offset: Int, completionHandler: @escaping (_ response: PaginatedCharacters?) -> Void)
}

struct CharactersAPIService: APIProtocol, CharactersDatabaseService {
    
    func paginationParameters(offset: Int) {
        
    }
    
    
    func md5() {
        
    }
    
    func getTimestamp() {
        
    }
    

    func fetchCharacters(offset: Int, completionHandler: @escaping(_ pagination: PaginatedCharacters?) -> Void) {
        
        let url = String(format: getUrl(url: .characters))
        let params = self.paginationParameters(offset: offset) as Parameters
        
        AF.request(url, method: .get, parameters: params)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        return
                    }
                    
                    do {
                        
                        let request = try JSONDecoder().decode(Response.self, from: data)
                        completionHandler(request.data)
                        
                    } catch {
                        completionHandler(nil)
                    }
                    
                case .failure (_):
                    completionHandler(nil)
                    
                }
        }
        
    }
    

    
    
    
}
