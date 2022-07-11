//
//  ThumbnailHero.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation

struct Thumbnail: Codable {
    
    let path: String
    let ext: String
    
    var url: String {
        
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        
        case path
        case ext = "extension"
    }
}
