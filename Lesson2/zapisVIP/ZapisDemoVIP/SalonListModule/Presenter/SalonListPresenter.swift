//
//  SalonListPresenter.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation
protocol SalonListPresenterProtocol {
    func setComponents(model: [SalonList])
}

class SalonListPresenter {
    
    private(set) var view: SalonListViewProtocol
    
    init(view: SalonListViewProtocol) {
        self.view = view
    }
}
extension SalonListPresenter: SalonListPresenterProtocol {
    func setComponents(model: [SalonList]) {
        view.setComponents(model: model)
    }
}
