//
//  BasePresenter.swift
//  HeroisMarvel
//
//  Created by Glauber Gustavo on 13/03/22.
//

import Foundation

protocol BasePresenterDelegate {
    func fail()
    func loading(_ value: Bool)
}

class BasePresenter {}
