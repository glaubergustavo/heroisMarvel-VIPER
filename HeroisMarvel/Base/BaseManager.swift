//
//  BaseManager.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation
import SwiftHash

class BaseManager {
    
    class func getCredentials() -> String {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+Constants.API.privateKey+Constants.API.publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(Constants.API.publicKey)&hash=\(hash)"
    }
}
