//
//  SalonDetailRouter.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit

protocol SalonDetailRouterProtocol {
    func createModule() -> UIViewController
}

class SalonDetailRouter {
    
    private let networkService: NetworkService
    private let salonId: Int
    
    init(networkService: NetworkService, salonId: Int) {
        self.networkService = networkService
        self.salonId = salonId
    }
}

extension SalonDetailRouter: SalonDetailRouterProtocol {
    func createModule() -> UIViewController {
        let view = SalonDetailViewController()
        let presenter: SalonDetailPresenterProtocol = SalonDetailPresenter(view: view)
        let interactor: SalonDetailInteractorProtocol = SalonDetailInteractor(networkService: networkService, presenter: presenter, salonId: salonId)
        
        view.interactor = interactor
        view.router = self
        return view
    }
}
