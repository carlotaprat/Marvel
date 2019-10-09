import Foundation

class PaginatedCharacters: Decodable {
    
    var results: [Character] = []
    var total: Int = 0
    var offset: Int = 0
    var limit: Int = 0
    var count: Int = 0
    
    enum PaginateCodingKeys: String, CodingKey {
        case results
        case total
        case offset
        case limit
        case count
    }
    
    init(results: [Character], total: Int, offset: Int, limit: Int, count: Int) {
        self.results.append(contentsOf: results)
        self.total = total
        self.offset = offset
        self.limit = limit
        self.count = count
    }
    
    required init(from decoder: Decoder) throws {
           
        let paginateContainer = try decoder.container(keyedBy: PaginateCodingKeys.self)
           
        let chars = try paginateContainer.decode([Character].self, forKey: .results)
        results.append(contentsOf: chars)
        total = try paginateContainer.decode(Int.self, forKey: .total)
        offset = try paginateContainer.decode(Int.self, forKey: .offset)
        limit = try paginateContainer.decode(Int.self, forKey: .limit)
        count = try paginateContainer.decode(Int.self, forKey: .count)

       }
    
    
}
