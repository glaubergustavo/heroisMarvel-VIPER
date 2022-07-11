//
//  MarvelInfo.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation

struct MarvelInfo: Codable {
    
    let code: Int
    let status: String
    let data: MarvelData
}
