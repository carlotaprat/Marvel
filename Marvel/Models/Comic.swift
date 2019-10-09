
import Foundation

class ComicObject: Decodable {
    
    var items: [Comic] = []
    
    enum MyCodingKeys: String, CodingKey {
        case myItems = "items"
    }
    
    required init(decoder: Decoder) throws {
        
        let comicContainer = try decoder.container(keyedBy: MyCodingKeys.self)
        var comicArray = try comicContainer.nestedUnkeyedContainer(forKey: .myItems)
        while !comicArray.isAtEnd {
            if let comic = try comicArray.decodeIfPresent(Comic.self) {
                self.items.append(comic)
            }
        }
    }
}

class Comic: Decodable {
    var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
