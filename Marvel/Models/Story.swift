
import Foundation

class StoryObject: Decodable {
    
    var items: [Story] = []
    
    enum MyCodingKeys: String, CodingKey {
        case myItems = "items"
    }
    
    required init(decoder: Decoder) throws {
        
        let storyContainer = try decoder.container(keyedBy: MyCodingKeys.self)
        var storyArray = try storyContainer.nestedUnkeyedContainer(forKey: .myItems)
        while !storyArray.isAtEnd {
            if let story = try storyArray.decodeIfPresent(Story.self) {
                self.items.append(story)
            }
        }
    }
    
}

class Story: Decodable {
    var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
