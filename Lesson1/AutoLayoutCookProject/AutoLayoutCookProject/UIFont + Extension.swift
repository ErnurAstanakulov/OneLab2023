//
//  UIFont + Extension.swift
//  AutoLayoutCookProject
//
//  Created by Yernur on 26.03.2023.
//

import UIKit

extension UIFont {
    public enum FontType {
        case bold
        case light
        case medium
        case regular
        case semibold
    }

    static func cignika(type: FontType, size: CGFloat) -> UIFont {
        switch type {
        case .bold:
            guard let font = UIFont(name: "Cignika-Bold", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .light:
            guard let font = UIFont(name: "Cignika-Light", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .medium:
            guard let font = UIFont(name: "Cignika-Medium", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .regular:
            guard let font = UIFont(name: "Cignika-Regular", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .semibold:
            guard let font = UIFont(name: "Cignika-Semibold", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        }
    }
}
