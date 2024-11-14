//
//  A11yID-ComponentType.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

extension A11yID {

    public struct ComponentType: Equatable, Sendable {
        let rawValue: String

        init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
