
import Foundation

class EventObject: Decodable {
    
    var items: [Event] = []
    
    enum MyCodingKeys: String, CodingKey {
        case myItems = "items"
    }
    
    required init(decoder: Decoder) throws {
        
        let eventContainer = try decoder.container(keyedBy: MyCodingKeys.self)
        var eventArray = try eventContainer.nestedUnkeyedContainer(forKey: .myItems)
        while !eventArray.isAtEnd {
            if let event = try eventArray.decodeIfPresent(Event.self) {
                self.items.append(event)
            }
        }
    }
    
}

class Event: Decodable {
    var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
