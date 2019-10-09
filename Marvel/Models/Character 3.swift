import Foundation



class Character: Decodable {
    
    var characterId: Int?
    var name: String?
    var description: String?
    var picture: ImageMarvel?
    var series: [String] = []
    var comics: [String] = []
    var events: [String] = []
    var stories: [String] = []
        
    enum CharacterCodingKeys: String, CodingKey {
        case characterId = "id"
        case name = "name"
        case description = "description"
        case imgPortrait = "thumbnail"
        case seriesCK = "series"
        case storiesCK = "stories"
        case eventsCK = "events"
        case comicsCK = "comics"
    }
    
    init(characterId: Int, name: String, description: String, picture: ImageMarvel, series: [String], comics: [String], events: [String], stories: [String]) {
        self.characterId = characterId
        self.name = name
        self.description = description
        self.picture = picture
        self.series.append(contentsOf: series)
        self.comics.append(contentsOf: comics)
        self.events.append(contentsOf: events)
        self.stories.append(contentsOf: stories)

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
        
        if let img = try characterContainer.decodeIfPresent(ImageMarvel.self, forKey: .imgPortrait) {
            self.picture = img
        }
        
        if let serieTmp = try characterContainer.decodeIfPresent(SerieObject.self, forKey: .seriesCK) {
            self.series = serieTmp.items.map({ (serie) -> String in
                serie.name
            })
        }
        
        if let storyTmp = try characterContainer.decodeIfPresent(StoryObject.self, forKey: .storiesCK) {
            self.stories = storyTmp.items.map({ (story) -> String in
                story.name
            })
        }
        
        if let comicTmp = try characterContainer.decodeIfPresent(ComicObject.self, forKey: .comicsCK) {
            self.comics = comicTmp.items.map({ (comic) -> String in
                comic.name
            })
        }
        
        if let eventTmp = try characterContainer.decodeIfPresent(EventObject.self, forKey: .eventsCK) {
            self.events = eventTmp.items.map({ (event) -> String in
                event.name
            })
        }
    }
    
}

