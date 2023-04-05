//
//  SalonListService.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

struct SalonListPopularNetworkContext: NetworkContext {
    var route: Route = .getBananas
    
    var method: NetworkMethod = .get
}

struct SalonListRecomendedNetworkContext: NetworkContext {
    var route: Route = .getApples
    
    var method: NetworkMethod = .get
}


struct SalonListRecentlyNetworkContext: NetworkContext {
    var route: Route = .getAppricots
    
    var method: NetworkMethod = .get
}
