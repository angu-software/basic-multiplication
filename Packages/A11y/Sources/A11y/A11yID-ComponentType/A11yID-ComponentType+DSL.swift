//
//  A11yID-ComponentType+DSL.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

extension A11yID.ComponentType {

    static let button  = Self.custom("Button")
    static let view    = Self.custom("View")
    static let subView = Self.custom("SubView")

    static func custom(_ rawValue: String) -> Self {
        return Self(rawValue: rawValue)
    }
}
