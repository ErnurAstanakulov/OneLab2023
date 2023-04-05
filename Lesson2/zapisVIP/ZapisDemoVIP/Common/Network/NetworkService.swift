//
//  NetworkService.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkService {
    @discardableResult
    func load(context: NetworkContext, completion: @escaping (NetworkResponse) -> Void) -> CancelableRequest?
    func load<T: Decodable>(context: NetworkContext, completion: @escaping (_ result: Result<T>) -> Void)
}
