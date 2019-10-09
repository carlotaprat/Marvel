import Foundation

class ImageMarvel: Decodable {
    
    var urlPortrait: String = ""
    var urlLandscape: String = ""
    
    enum ImageCodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    init(urlPortrait: String, urlLandscape: String) {
        self.urlPortrait = urlPortrait
        self.urlLandscape = urlLandscape
    }
    
    required init(from decoder: Decoder) throws {

        let imageContainer = try decoder.container(keyedBy: ImageCodingKeys.self)
        if let path = try imageContainer.decodeIfPresent(String.self, forKey: .path),
            let ext = try imageContainer.decodeIfPresent(String.self, forKey: .ext) {
            generatePath(path: path, ext: ext)
           
        }
    }
    
    func generatePath(path: String, ext: String) {
        let variantPortrait = "portrait_xlarge"
        let variantLandscape = "landscape_xlarge"
        
        self.urlPortrait = path + "/" + variantPortrait + "." + ext
        self.urlLandscape = path + "/" + variantLandscape + "." + ext
    }
}
