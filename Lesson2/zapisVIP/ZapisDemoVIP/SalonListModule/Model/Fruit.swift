//
//  SalonListModel.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

struct Fruit: Codable {
    let genus, name: String
    let id: Int
    let family, order: String
    let nutritions: Nutritions
    var pictureUrl: String?
    let pictures: [String]? = []
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let carbohydrates, protein, fat: Double
    let calories: Int
    let sugar: Double
}
