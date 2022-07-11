//
//  HeroesDetailsPresenter.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation
import UIKit

protocol HeroesDetailsPresenterDelegate {}

class HeroesDetailsPresenter {
    
    var delegate: HeroesDetailsPresenterDelegate!
    
    var hero: Hero!
    
    init(delegate: HeroesDetailsPresenterDelegate) {
        self.delegate = delegate
    }
}
