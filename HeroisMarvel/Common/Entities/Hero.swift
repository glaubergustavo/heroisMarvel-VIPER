//
//  Hero.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation

struct Hero: Codable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let urls: [HeroURL]
}
