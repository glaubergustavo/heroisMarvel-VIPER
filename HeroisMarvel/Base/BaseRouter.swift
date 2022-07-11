//
//  BaseRouter.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import UIKit

class BaseRouter {
    
    var storyboard: UIStoryboard!
    var viewController: UIViewController!
    
    func show() {
        
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present() {
        
        let navController = UINavigationController(rootViewController: viewController)
        UIApplication.topViewController()?.present(navController, animated: true, completion: nil)
    }
    
    func dismissView(_ type: NavigationType = .push) {
        
        if type == .push {
            UIApplication.topViewController()?.navigationController?.popViewController(animated: true)
        }else{
            UIApplication.topViewController()?.dismiss(animated: true, completion: nil)
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Navigation
    //-----------------------------------------------------------------------
    
    func showHeroesDetail(item: Hero, _ type: NavigationType = .push) {
        
        if type == .push {
            HeroesDetailsRouter(item).show()
        }else{
            HeroesDetailsRouter(item).present()
        }
    }
}
