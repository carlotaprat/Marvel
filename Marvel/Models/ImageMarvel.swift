//
//  ImagePortrait.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

class ImageMarvel: Decodable {
    
    var urlPortrait: String = ""
    var urlLandscape: String = ""
    
    enum ImageCodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    required init(from decoder: Decoder) throws {
        
        let variantPortrait = "portrait_xlarge"
        let variantLandscape = "landscape_xlarge"
        
        let imageContainer = try decoder.container(keyedBy: ImageCodingKeys.self)

        if let path = try imageContainer.decodeIfPresent(String.self, forKey: .path),
            let ext = try imageContainer.decodeIfPresent(String.self, forKey: .ext) {
            self.urlPortrait = path + "/" + variantPortrait + "." + ext
            self.urlLandscape = path + "/" + variantLandscape + "." + ext
        }

    }
    
}
