//
//  HeroesDetailsRouter.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//


import UIKit

class HeroesDetailsRouter: BaseRouter {
    
    init(_ item: Hero) {
        super.init()
        
        storyboard = UIStoryboard(name: "HeroesDetails", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "HeroesDetailsView") as? HeroesDetailsViewController {
            
            controller.presenter = HeroesDetailsPresenter(delegate: controller)
            controller.presenter.hero = item
            
            viewController = controller
        }
    }
}
