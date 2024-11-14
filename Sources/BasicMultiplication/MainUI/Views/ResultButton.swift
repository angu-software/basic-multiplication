//
//  ResultButton.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

import UITokens

struct ResultButton: View {
    var value: String
    var isSelected: Bool
    var action: () -> Void

    private let size = CGSize(width: .xxl,
                              height: .l)

    init(_ value: String, isSelected: Bool, action: @escaping () -> Void) {
        self.value = value
        self.isSelected = isSelected
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(value)
                .frame(minWidth: size.width,
                       minHeight: size.height)
        }
        .background(isSelected ? .selectedProduct : .clear)
        .border(.accent)
    }
}
