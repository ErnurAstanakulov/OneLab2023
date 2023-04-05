//
//  ViewInitilizeProtocol.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import Foundation

protocol ViewInitilizeProtocol {
    func addSubviews()
    func setupConstraints()
    func stylizeViews()
    func extraTasks()
}

extension ViewInitilizeProtocol {
    func extraTasks() {}
    
    func setupViews() {
        addSubviews()
        setupConstraints()
        stylizeViews()
        extraTasks()
    }
}
