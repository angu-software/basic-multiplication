//
//  SubmitButton.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

import UITokens

struct SubmitButton: View {

    var label: String
    var action: () -> Void

    private let maxHeight = SizeToken.xLarge.rawValue

    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(label)
                .frame(maxWidth: .infinity,
                       maxHeight: maxHeight)
        }
        .border(.accent)
    }
}
