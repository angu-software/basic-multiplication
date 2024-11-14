//
//  A11yID-ComponentType+DSL.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

extension A11yID.ComponentType {

    public static let button  = Self.custom("Button")
    public static let view    = Self.custom("View")
    public static let subView = Self.custom("SubView")

    public static func custom(_ rawValue: String) -> Self {
        return Self(rawValue: rawValue)
    }
}
