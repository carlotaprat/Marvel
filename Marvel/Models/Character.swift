//
//  Hero.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

class Character: Decodable {
    
    var characterId: Int?
    var name: String?
    var description: String?
    var imgPortrait: ImagePortrait?
    /*var comics: [Comic] = []
    var events: [Event] = []
    var stories: [Story] = []
    var series: [Serie] = []*/
    
    // enum CodingKeys: String, CodingKey
    
    enum CharacterCodingKeys: String, CodingKey {
        case characterId = "id"
        case name = "name"
        case description = "description"
        case imgPortrait = "thumbnail"
    }
    
    
    required init(from decoder: Decoder) throws {
        
        let characterContainer = try decoder.container(keyedBy: CharacterCodingKeys.self)
        
        if let characterId = try characterContainer.decodeIfPresent(Int.self, forKey: .characterId) {
            self.characterId = characterId
        }
        
        if let name = try characterContainer.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }
        
        if let description = try characterContainer.decodeIfPresent(String.self, forKey: .description) {
            self.description = description
        }
        
        if let img = try characterContainer.decodeIfPresent(ImagePortrait.self, forKey: .imgPortrait) {
            self.imgPortrait = img
        }
    }
    
}
