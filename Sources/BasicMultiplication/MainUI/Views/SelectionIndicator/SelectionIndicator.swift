//
//  SelectionIndicator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 25.09.24.
//

import SwiftUI

import UITokens

struct SelectionIndicator: View {

    var selection: Selection = .notChosen

    private let size = CGSize(width: SizeToken.xLarge,
                              height: SizeToken.xLarge)

    var body: some View {
        let style = Style(selection: selection)
        Image(systemName: style.imageName)
            .resizable()
            .foregroundStyle(style.imageTint)
            .frame(width: size.width,
                   height: size.height)
            .accessibilityElement()
            .accessibilityIdentifier(style.accessibilityId)
    }
}
