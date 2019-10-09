
import Foundation

class SerieObject: Decodable {
    
    var items: [Serie] = []
    
    enum MyCodingKeys: String, CodingKey {
        case myItems = "items"
    }
    
    required init(decoder: Decoder) throws {
        
        let serieContainer = try decoder.container(keyedBy: MyCodingKeys.self)
        var seriesArray = try serieContainer.nestedUnkeyedContainer(forKey: .myItems)
        while !seriesArray.isAtEnd {
            if let serie = try seriesArray.decodeIfPresent(Serie.self) {
                self.items.append(serie)
            }
        }
    }
    
}

class Serie: Decodable {
    var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
