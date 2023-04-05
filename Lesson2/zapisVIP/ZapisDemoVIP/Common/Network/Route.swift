//
//  Router.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

public enum Route: RouteProtocol {
    case getBananas
    case getApples
    case getAppricots
    case salonPageById(id:Int)
    
    public var serverUrl: String {
        return baseURL
    }
}

extension Route {
    public var rawValue: String {
        switch self {
        case .getBananas: return "banana"
        case .getApples: return "apple"
        case .getAppricots: return "apricot"
        case .salonPageById(let id): return "page?id=\(id)"
        }
    }
}
