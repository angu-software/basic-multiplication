//
//  SwiftUIView+A11yID.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

import SwiftUI

import A11y

extension View {

    public func a11yID(_ id: A11yID) -> some View {
        return self.accessibilityElement(children: .combine)
            .accessibilityIdentifier(id.value)
    }
}
