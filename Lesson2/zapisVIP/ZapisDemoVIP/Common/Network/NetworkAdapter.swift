//
//  NetworkAdapter.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration

final class NetworkAdapter: NetworkService {
    
    let sesssionManager: AppSessionMananger
    
    init(sessionManager: AppSessionMananger) {
        self.sesssionManager = sessionManager
    }
    
    func load(context: NetworkContext, completion: @escaping (NetworkResponse) -> Void) -> CancelableRequest? {
        guard NetworkConnectionStatus.checkCurrentConnectionStatus != .notAvailable else {
            completion(FailureNetworkResponse(networkError: .noConnection))
            return nil
        }
        
        let dataRequest: DataRequest
        if context.httpBody != nil {
            guard let urlRequest = urlRequestFrom(networkContext: context)
                else { completion(FailureNetworkResponse(networkError: .unknown)); return nil }
            dataRequest = sesssionManager.request(urlRequest)
        } else {
            dataRequest = dataRequestFrom(networkContext: context)
        }
        
        return dataRequest.validate().responseData { [weak self] serverResponse in
            guard self != nil else { return }
            
            guard serverResponse.response != nil else {
                completion(FailureNetworkResponse(networkError: .unknown))
                return
            }
            
            completion(serverResponse)
        }
    }
    
    private func urlRequestFrom(networkContext context: NetworkContext) -> URLRequest? {
        guard var urlRequest = try? URLRequest(
            url: context.urlString,
            method: convertHttpMethod(from: context.method)
            ) else {
                return nil
        }
        urlRequest.httpBody = context.httpBody
        urlRequest.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        context.header.forEach {
            urlRequest.setValue($1, forHTTPHeaderField: $0)
        }
        return urlRequest
    }
    
    private func dataRequestFrom(networkContext context: NetworkContext) -> DataRequest {
        return sesssionManager.request(
            context.urlString,
            method: convertHttpMethod(from: context.method),
            parameters: context.parameters,
            encoding: convertEncoding(from: context.encoding),
            headers: context.header
        )
    }
    
    private func convertHttpMethod(from networkMethod: NetworkMethod) -> HTTPMethod {
        switch networkMethod {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .delete: return .delete
        }
    }
    
    private func convertEncoding(from networkEncoding: NetworkEncoding) -> ParameterEncoding {
        switch networkEncoding {
        case .json: return JSONEncoding.default
        case .url: return URLEncoding.default
        case .urlString: return URLEncoding(destination: .queryString)
        }
    }
    
    func load<T>(context: NetworkContext, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        fatalError("Not realized!")
    }
}

extension DataResponse: NetworkResponse {
    var isSuccess: Bool {
        return result.isSuccess
    }
    
    var networkError: NetworkError? {
        guard let error = error, let alamofireError = error as? AFError else {
            return nil
        }
        
        if alamofireError.responseCode == 401 {
            return .unauthorized
        }
        
        let description = json?["error_description"] as? String
            ?? json?["value"] as? String
            ?? json?["errorMessage"] as? String
        
        if description == "User locked" {
            return .locked
        }
        
        return .serverError(description: description ?? alamofireError.localizedDescription)
    }
}

protocol CancelableRequest{
    func cancel()
}

extension DataRequest: CancelableRequest {}

class FailureNetworkResponse: NetworkResponse {
    var isSuccess: Bool { return false }
    var data: Data? { return nil }
    var networkError: NetworkError?
    
    init(networkError: NetworkError) {
        self.networkError = networkError
    }
}
