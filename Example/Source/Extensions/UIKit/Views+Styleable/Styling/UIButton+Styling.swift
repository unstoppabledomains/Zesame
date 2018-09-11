//
//  UIButton+Styling.swift
//  ZilliqaSDKiOSExample
//
//  Created by Alexander Cyon on 2018-09-08.
//  Copyright © 2018 Open Zesame. All rights reserved.
//

import UIKit

extension UIButton: Styling, StaticEmptyInitializable, ExpressibleByStringLiteral {

    public static func createEmpty() -> UIButton {
        return UIButton(type: .custom)
    }

    public final class Style: ViewStyle, Makeable, ExpressibleByStringLiteral {

        typealias View = UIButton

        let text: String
        let textColor: UIColor
        let font: UIFont

        init(_ text: String, height: CGFloat? = CGFloat.defaultHeight, font: UIFont = .default, textColor: UIColor = .black, backgroundColor: UIColor = .green) {
            self.text = text
            self.textColor = textColor
            self.font = font
            super.init(height: height, backgroundColor: backgroundColor)
        }

        public convenience init(stringLiteral title: String) {
            self.init(title)
        }
    }

    public func apply(style: Style) {
        setTitle(style.text, for: UIControl.State())
        setTitleColor(style.textColor, for: UIControl.State())
        titleLabel?.font = style.font
        backgroundColor = style.backgroundColor
    }
}
