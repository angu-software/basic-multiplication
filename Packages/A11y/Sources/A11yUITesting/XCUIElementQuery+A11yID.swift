//
//  XCUIElementQuery+A11yID.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

import XCTest

import A11y

extension XCUIElementQuery {

    public subscript(a11yID: A11yID) -> XCUIElement {
        return self[a11yID.value]
    }
}
