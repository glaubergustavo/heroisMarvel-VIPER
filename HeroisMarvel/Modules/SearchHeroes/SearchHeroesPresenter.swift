//
//  SearchHeroesPresenter.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation
import UIKit

protocol SearchHeroesPresenterDelegate {
    func dataLoaded()
}

class SearchHeroesPresenter: BasePresenter {
    
    var heroes: [Hero] = []
    var name: String?
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    var delegate: SearchHeroesPresenterDelegate!
    
    init(delegate: SearchHeroesPresenterDelegate) {
        self.delegate = delegate
    }
    
    func loadHeroes(name: String) {
        
        self.heroes = []
        
        loadingHeroes = true
        SearchHeroesManager.loadHeros(name: name, page: currentPage) { info in
            if let info = info {
                
                self.heroes += info.data.results
                self.total = info.data.total
                
                print("Total:", self.total, "- Já incluídos:", self.heroes.count)
                
                self.delegate.dataLoaded()
            }
        }
    }
    
    func showDetail(index: Int) {
        
        SearchHeroesRouter().showHeroesDetail(item: heroes[index], .push)
    }
}
