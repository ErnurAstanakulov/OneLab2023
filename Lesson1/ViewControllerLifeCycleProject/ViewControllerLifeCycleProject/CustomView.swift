//
//  CustomView.swift
//  ViewControllerLifeCycleProject
//
//  Created by Yernur on 26.03.2023.
//

import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(UIView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        // Tells the view that a subview was added.
        print("didAddSubview")
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        // Tells the view that a subview is about to be removed.
        print("willRemoveSubview")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        // Tells the view that its window object is about to change.
        print("willMove")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // Tells the view that its superview changed.
        print("didMoveToSuperview")
    }
}
