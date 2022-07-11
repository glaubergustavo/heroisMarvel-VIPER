//
//  MarvelData.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation

struct MarvelData: Codable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}
