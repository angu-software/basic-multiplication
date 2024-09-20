//
//  SubmitButton.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

struct SubmitButton: View {
    var label: String
    var action: () -> Void

    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    var body: some View {
        Button(label, action: action)
        .frame(maxWidth: .infinity, maxHeight: 64)
        .border(.accent)
    }
}
