//
//  Constants.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation

class Constants {
    
    struct API {
        
        static let basePath = "https://gateway.marvel.com/v1/public/characters?"
        static let privateKey = "b8c05a10be87ae73d35c33a36057d86ce8ba23c7"
        static let publicKey = "323a332cc164b75d52e623aebf50c432"
        static let limit = 50
    }
    
    struct Messages {
        
        static let EnterHeroName = "Por favor!\n Insira o nome de algum\n Herói da Marvel"
        static let SearchHeroes = "Buscando Heróis. Aguarde..."
    }
}
