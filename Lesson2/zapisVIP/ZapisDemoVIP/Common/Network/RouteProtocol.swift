//
//  RouteProtocol.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation
public protocol RouteProtocol {
    
    /// Server URL
    var serverUrl: String { get }
    
    /// route API
    var rawValue: String { get }
}

public extension RouteProtocol {
    
    /// Get complete URL route
    var urlString: String { return serverUrl + rawValue }
}
