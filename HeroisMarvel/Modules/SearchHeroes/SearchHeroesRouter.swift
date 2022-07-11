//
//  SearchHeroesRouter.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//


import UIKit

class SearchHeroesRouter: BaseRouter {
    
    override init() {
        super.init()
        
        storyboard = UIStoryboard(name: "SearchHeroes", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "SearchHeroesView") as? SearchHeroesViewController {
            
            controller.presenter = SearchHeroesPresenter(delegate: controller)
            
            viewController = controller
        }
    }
}
