//
//  ImagePortrait.swift
//  Marvel
//
//  Created by José Luis on 07/10/2019.
//  Copyright © 2019 carlotaprat. All rights reserved.
//

import Foundation

class ImagePortrait: Decodable {
    
    var url: String = ""
    
    enum ImageCodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    required init(from decoder: Decoder) throws {
        
        let variant = "portrait_xlarge"
        
        let imageContainer = try decoder.container(keyedBy: ImageCodingKeys.self)

        if let path = try imageContainer.decodeIfPresent(String.self, forKey: .path),
            let ext = try imageContainer.decodeIfPresent(String.self, forKey: .ext) {
            self.url = path + "/" + variant + "." + ext
        }

    }
    
}
