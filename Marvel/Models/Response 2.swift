import Foundation

class Response: Decodable {
    
    let data: PaginatedCharacters?
    let code: Int?
    let status: String?
    
    enum ResponseCodingKeys: String, CodingKey {
        case data
        case code
        case status
    }
    
    required init(from decoder: Decoder) throws {
        
        let responseContainer = try decoder.container(keyedBy: ResponseCodingKeys.self)
        
        if let code = try responseContainer.decodeIfPresent(Int.self, forKey: .code) {
            self.code = code
        } else {
            self.code = 0
        }
        
        if let status = try responseContainer.decodeIfPresent(String.self, forKey: .status) {
            self.status = status
        } else {
            self.status = ""
        }
        
        if let data = try responseContainer.decodeIfPresent(PaginatedCharacters.self, forKey: .data) {
            self.data = data
        } else {
            self.data = nil
        }
    }
}


