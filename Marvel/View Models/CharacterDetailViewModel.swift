import Foundation

class CharacterDetailViewModel {
    
    private var character: Character?
    private let unknownString = "unknown"
    private let noDescriptionString = "no_description"
    private let noComicsString = "no_comics"
    private let noEventsString = "no_events"
    private let noSeriesString = "no_series"
    private let noStoriesString = "no_stories"
    private let separator = ", "
    private let dot = "."
    
    func setCharacter(character: Character) {
        self.character = character
    }
    
    func getName() -> String {
        
        guard let char = character else {
            return ""
        }
        
        return char.name ?? unknownString.localized
        
    }
    
    func getDescription() -> String {
           
        guard let char = character else {
            return ""
        }
           
        if char.description == "" {
            return noDescriptionString.localized
        } else {
           return char.description ?? noDescriptionString.localized
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
            notFound = noComicsString.localized
            items = char.comics
            
        case .event:
            notFound = noEventsString.localized
            items = char.events

        case .story:
            notFound = noStoriesString.localized
            items = char.stories

        case .serie:
            notFound = noSeriesString.localized
            items = char.series

        }
        if items.count == 0 {
            return notFound
        } else {
            return items.joined(separator: separator) + dot
        }
    }
    
    
    
}
