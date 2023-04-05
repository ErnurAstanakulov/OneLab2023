//
//  SalonDetailModel.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

struct SalonDetailModel: Decodable {
    let salon: Fruit
    let location: Location
}

struct Location: Decodable {
    let type: String
    let markerX: Double
    let markerY: Double
    let centerX: Double
    let centerY: Double
    let zoom: Int
}
