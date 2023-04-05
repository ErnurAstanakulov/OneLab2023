//
//  SalonDetailPresenter.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

protocol SalonDetailPresenterProtocol {
    func setInfo(about: SalonDetailModel)
}

class SalonDetailPresenter {
    
    private(set) var view: SalonDetailViewProtocol
    init(view: SalonDetailViewProtocol) {
        self.view = view
    }
}

extension SalonDetailPresenter: SalonDetailPresenterProtocol {
    func setInfo(about: SalonDetailModel) {
        view.setInfo(about: about)
    }
    
    
}
