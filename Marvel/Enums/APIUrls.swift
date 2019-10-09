import Foundation

enum APIUrls: String {
    
    case characters = "characters"
    
    var getUrl: String {
        return "http://gateway.marvel.com/v1/public/\(self.rawValue)"
    }
}
