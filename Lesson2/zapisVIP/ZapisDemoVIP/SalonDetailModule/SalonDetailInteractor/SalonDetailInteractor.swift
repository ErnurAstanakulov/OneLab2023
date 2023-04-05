//
//  SalonDetailInteractor.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation
import Alamofire

protocol SalonDetailInteractorProtocol {
    func loadInfo()
}

class SalonDetailInteractor {
    
    private let networkService: NetworkService
    private let presenter: SalonDetailPresenterProtocol
    private let salonId: Int
    
    init(
        networkService: NetworkService,
        presenter: SalonDetailPresenterProtocol,
        salonId: Int
    ) {
        self.networkService = networkService
        self.presenter = presenter
        self.salonId = salonId
    }
    
    private func loadDetailSalon(onCompletion pass: @escaping (_ result: Result<SalonDetailModel>) -> ()) {
        let networkContext = SalonPageNetworkContext(id: salonId)
        networkService.load(context: networkContext) { (networkResponse) in
            guard let result: SalonDetailModel = networkResponse.decode() else {
                pass(.failure(NetworkError.dataLoad))
                return
            }
            pass(.success(result))
        }
        
    }
}

extension SalonDetailInteractor: SalonDetailInteractorProtocol {
    func loadInfo() {
        loadDetailSalon { [weak self] (result) in
            guard let interactor = self else { return }
            switch result {
            case .success(let model):
                interactor.presenter.setInfo(about: model)
            case .failure(let error):
                // this must be code about show error
                fatalError("loadDetailSalon have problems \(error)")
            }
        }
    }
}
