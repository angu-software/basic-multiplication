//
//  SelectionIndicator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 25.09.24.
//

import SwiftUI

import UITokens

struct SelectionIndicator: View {

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

        init(selection: Bool?) {
            switch selection {
            case true:
                self = .correctSelection()
            case false:
                self = .wrongSelection()
            default:
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

    var selection: Bool?

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
