//
//  SalonListInteractor.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation
import Alamofire

protocol SalonListInteractorProtocol {
    func loadLists()
}

class SalonListInteractor
{
    
    private let networkService: NetworkService
    private let presenter: SalonListPresenterProtocol
    
    init(networkService: NetworkService, presenter: SalonListPresenterProtocol){
        self.networkService = networkService
        self.presenter = presenter
    }
    
}

extension SalonListInteractor: SalonListInteractorProtocol {
    
    func loadLists() {
        var components: [SalonList] = []
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        loadPopularSalons { (result) in
            dispatchGroup.leave()
            switch result {
            case .success(let value):
                let popularSalonComponent: SalonList = SalonList(rows: value, title: "Популярные", height: 300)
                components.append(popularSalonComponent)
            case .failure(let error):
                fatalError("error showing logic\(error)")
            }
        }
        
        dispatchGroup.enter()
        loadRecomendedSalons { (result) in
            dispatchGroup.leave()
            switch result {
            case .success(let value):
                let popularSalonComponent: SalonList = SalonList(rows: value, title: "Рекомендуемые", height: 300)
                components.append(popularSalonComponent)
            case .failure(let error):
                fatalError("error showing logic\(error)")
            }
        }
        
        dispatchGroup.enter()
        loadRecentSalons { (result) in
            dispatchGroup.leave()
            switch result {
            case .success(let value):
                let popularSalonComponent: SalonList = SalonList(rows: value, title: "Недавно добавленные", height: 300)
                components.append(popularSalonComponent)
            case .failure(let error):
                // this must be code about show error
                fatalError("error showing logic\(error)")
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.presenter.setComponents(model: components)
        }
    }
    
    
    private func loadPopularSalons(onCompletion pass: @escaping (_ result: Result<[Fruit]>) -> ()) {
        let networkContext = SalonListPopularNetworkContext()
        networkService.load(context: networkContext) { (networkResponse) in
            guard var result: Fruit = networkResponse.decode() else {
                pass(.failure(NetworkError.dataLoad))
                return
            }
            result.pictureUrl = "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51ebZJ+DR4L._SL1500_.jpg"

            pass(.success(Array(repeating: result, count: 5)))
        }
    }
    
    private func loadRecentSalons(onCompletion pass: @escaping (_ result: Result<[Fruit]>) -> ()) {
        let networkContext = SalonListRecentlyNetworkContext()
        networkService.load(context: networkContext) { (networkResponse) in
            guard var result: Fruit = networkResponse.decode() else {
                pass(.failure(NetworkError.dataLoad))
                return
            }
            result.pictureUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Apricot_and_cross_section.jpg/440px-Apricot_and_cross_section.jpg"
            pass(.success(Array(repeating: result, count: 4)))
        }
    }
    
    private func loadRecomendedSalons(onCompletion pass: @escaping (_ result: Result<[Fruit]>) -> ()) {
        let networkContext = SalonListRecomendedNetworkContext()
        networkService.load(context: networkContext) { (networkResponse) in
            guard var result: Fruit = networkResponse.decode() else {
                pass(.failure(NetworkError.dataLoad))
                return
            }
            result.pictureUrl = "https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png"

            pass(.success(Array(repeating: result, count: 8)))
        }
    }
}

