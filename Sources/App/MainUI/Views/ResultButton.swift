//
//  ResultButton.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

struct ResultButton: View {
    var value: String
    var action: () -> Void

    init(_ value: String, action: @escaping () -> Void) {
        self.value = value
        self.action = action
    }

    var body: some View {
        Button(value,
               action: action)
        .frame(minWidth: 56, minHeight: 42)
        .border(.accent)
    }
}
