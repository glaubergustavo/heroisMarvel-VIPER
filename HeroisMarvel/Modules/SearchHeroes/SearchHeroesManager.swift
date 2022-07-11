//
//  SearchHeroesManager.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation
import Alamofire

final class SearchHeroesManager: BaseManager {
    
    class func loadHeros(name: String?,
                         page: Int = 0,
                         onComplete: @escaping (MarvelInfo?) -> Void) {
        
        let offset = page * Constants.API.limit
        let startsWith: String
        
        if let name = name, !name.isEmpty {
            
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        let url = Constants.API.basePath + "offset=\(offset)&limit=\(Constants.API.limit)&" + startsWith + getCredentials()
        print(url)
        Alamofire.AF.request(url).responseJSON { response in
            guard let data = response.data else {
                
                onComplete(nil)
                return
            }
            
            do {
                let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                onComplete(marvelInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
}
