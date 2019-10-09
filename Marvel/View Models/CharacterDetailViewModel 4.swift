//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by José Luis on 08/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

class CharacterDetailViewModel: ViewModel {
    
    private var character: Character?
    
    func setCharacter(character: Character) {
        self.character = character
    }
    
    func getName() -> String {
        
        guard let char = character else {
            return ""
        }
        
        return char.name ?? NSLocalizedString("unknown", comment: "")
        
    }
    
    func getDescription() -> String {
           
        guard let char = character else {
            return ""
        }
           
        if char.description == "" {
            return NSLocalizedString("no_description", comment: "")
        } else {
           return char.description ?? NSLocalizedString("no_description", comment: "")
        }
           
       }
    
    func getImage() -> String {
        guard let char = character else {
            return ""
        }
        return char.picture?.urlLandscape ?? ""
    }
    
    func getFormattedArray(feature: Feature) -> String {
        guard let char = character else {
            return ""
        }
        var items: [String]
        var notFound = ""
        switch feature {
        case .comic:
            notFound = NSLocalizedString("no_comics", comment: "")
            items = char.comics
            
        case .event:
            notFound = NSLocalizedString("no_events", comment: "")
            items = char.events

        case .story:
            notFound = NSLocalizedString("no_stories", comment: "")
            items = char.stories

        case .serie:
            notFound = NSLocalizedString("no_series", comment: "")
            items = char.series

        }
        if items.count == 0 {
            return notFound
        } else {
            return items.joined(separator: ", ") + "."
        }
    }
    
    
    
}
