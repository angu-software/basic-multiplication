//
//  SelectionIndicator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 25.09.24.
//

import SwiftUI

import UITokens

struct SelectionIndicator: View {

    enum Selection {
        case correct
        case wrong
        case notChosen
    }

    struct Style {

        static func correctSelection() -> Self {
            return Self(imageName: "checkmark.seal.fill",
                        imageTint: .correctSelection,
                        accessibilityId: "correct")
        }

        static func wrongSelection() -> Self {
            return Self(imageName: "xmark.seal.fill",
                        imageTint: .wrongSelection,
                        accessibilityId: "wrong")
        }

        static func noSelection() -> Self {
            return Self(imageName: "",
                        imageTint: .clear)
        }

        let imageName: String
        let imageTint: Color
        let accessibilityId: String

        init(selection: Selection) {
            switch selection {
            case .correct:
                self = .correctSelection()
            case .wrong:
                self = .wrongSelection()
            case .notChosen:
                self = .noSelection()
            }
        }

        private init(imageName: String,
                     imageTint: Color,
                     accessibilityId: String = "") {
            self.imageName = imageName
            self.imageTint = imageTint
            self.accessibilityId = accessibilityId
        }
    }

    var selection: Selection = .notChosen

    private let size = CGSize(width: SizeToken.xl,
                              height: SizeToken.xl)

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
