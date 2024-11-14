//
//  A11yID-ComponentType+StringLiteral.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

extension A11yID.ComponentType: ExpressibleByStringLiteral {

    // MARK: ExpressibleByStringLiteral

    public init(stringLiteral value: StringLiteralType) {
        self.init(rawValue: value)
    }
}
