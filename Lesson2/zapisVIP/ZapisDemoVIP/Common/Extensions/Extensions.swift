//
//  Extensions.swift
//  ZapisDemoVIP
//
//  Created by psuser on 11/3/19.
//  Copyright © 2019 psuser. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func addConstaintsToHorizontal(padding: CGFloat = 0) -> [NSLayoutConstraint] {
        prepareForConstraints()
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: padding))
        constraints.append(trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -padding))
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
    
    func addConstaintsToVertical(padding: CGFloat = 0) {
        prepareForConstraints()
        self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: padding).isActive = true
        self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -padding).isActive = true
    }
    
    func addConstaintsToFill(padding: CGFloat = 0) {
        prepareForConstraints()
        addConstaintsToHorizontal(padding: padding)
        addConstaintsToVertical(padding: padding)
    }
    
    private func prepareForConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        if superview == nil {
            assert(false, "You need to have a superview before you can add contraints")
        }
    }
}
