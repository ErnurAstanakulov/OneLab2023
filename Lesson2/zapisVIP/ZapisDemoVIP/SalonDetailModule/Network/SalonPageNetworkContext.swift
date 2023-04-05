//
//  SalonDetailService.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

struct SalonPageNetworkContext: NetworkContext {
    private let id: Int
    var route: Route {
        return .salonPageById(id: id)
    }
    
    init(id: Int) {
        self.id = id
    }
    
    var method: NetworkMethod = .get
}

