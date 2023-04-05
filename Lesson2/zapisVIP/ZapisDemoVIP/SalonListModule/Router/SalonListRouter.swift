//
//  SalonListRouter.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit
import Alamofire

protocol SalonListRouterProtocol {
    func createModule() -> UIViewController
    func openSalonModule(with id: Int)
}

class SalonListRouter {
    private let networkService = NetworkAdapter(sessionManager: AppSessionMananger())
    private var view: UIViewController?
}

extension SalonListRouter: SalonListRouterProtocol {
    
    
    func createModule() -> UIViewController {
        let view = SalonListViewController()
        let presenter: SalonListPresenterProtocol = SalonListPresenter(view: view)
        let interactor: SalonListInteractorProtocol =  SalonListInteractor(networkService: networkService, presenter: presenter)
        view.interactor = interactor
        view.router = self
        self.view = view
        return view
    }
    
    func openSalonModule(with id: Int) {
        let detailModule = SalonDetailRouter(networkService: networkService, salonId: id).createModule()
        view?.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        view?.navigationController?.navigationBar.shadowImage = UIImage()
        view?.navigationController?.view.backgroundColor = .clear
        view?.navigationController?.navigationBar.isTranslucent = true
        view?.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        view?.navigationController?.pushViewController(detailModule, animated: true)
    }
}
