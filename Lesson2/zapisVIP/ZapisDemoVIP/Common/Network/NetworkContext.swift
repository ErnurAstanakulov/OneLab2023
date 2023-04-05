//
//  NetworkContext.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

protocol NetworkContext {
    var route: Route { get }
    var method: NetworkMethod { get }
    var parameters: [String: Any] { get }
    var encoding: NetworkEncoding { get }
    var httpBody: Data? { get }
    var header: [String: String] { get }
}

extension NetworkContext {
    
    var urlString: String { return route.urlString }
    
    var parameters: [String: Any] { return [:] }
    
    var encoding: NetworkEncoding { return .url }
    
    static func encode<T: Codable>(_ object: T) -> Any? {
        if let data = try? JSONEncoder().encode(object) {
            return try? JSONSerialization.jsonObject(with: data)
        }
        return nil
    }
    
    var httpBody: Data? { return nil }
    
    var header: [String: String] { return [:] }
}

public enum NetworkMethod {
    case get, post, put, delete
}
public enum NetworkEncoding {
    case json, url, urlString
}

enum NetworkError: AppError {
    case serverError(description: String)
    case dataLoad
    case unknown
    case noConnection
    case unauthorized
    case locked
    
    var description: String {
        switch self {
        case .serverError(let description):
            return description
        case .dataLoad:
            return "Возникла ошибка при загрузке данных. Приносим свои извинения за доставленные неудобства."
        case .unknown:
            return "Возникла непредвиденная ошибка. Приносим свои извинения за доставленные неудобства."
        case .noConnection:
            return "Отсутствует интернет соединение"
        case .unauthorized:
            return "Неверный логин или пароль"
        case .locked:
            return "Пользователь заблокирован"
        }
    }
}

import SystemConfiguration

public enum NetworkConnectionStatus {
    case notAvailable, availableViaWWAN, availableViaWiFi
    
    static var checkCurrentConnectionStatus: NetworkConnectionStatus {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1, {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            })
        }
        
        guard let target = defaultRouteReachability else { return .notAvailable }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(target, &flags) { return .notAvailable }
        
        if !flags.contains(.reachable) { return .notAvailable }
        else if flags.contains(.isWWAN) { return .availableViaWWAN }
        else if !flags.contains(.connectionRequired) { return .availableViaWiFi }
        else if (flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic) && !flags.contains(.interventionRequired)) {
            return .availableViaWiFi
        }
        else { return .notAvailable }
    }
}
protocol AppError: Error {
    var description: String { get }
}
