//
//  AppDelegate.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: SearchHeroesRouter().viewController)
        window?.makeKeyAndVisible()
        
        return true
    }
}

