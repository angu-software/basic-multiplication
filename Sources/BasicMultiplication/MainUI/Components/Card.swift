//
//  Card.swift
//  One Times One
//
//  Created by Andreas Günther on 26.12.25.
//

import SwiftUI

struct Card<Content: View>: View {

    // Layout
    private let cornerRadius: CGFloat = 25
    private let borderWidth: CGFloat = 2
    var shadwoRadius: CGFloat = 10
    private let contentPadding: CGFloat = 20

    // Style
    var backgroundColor = Color.white
    var borderColor: Color = .clear

    @ViewBuilder var content: Content

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .stroke(borderColor,
                        lineWidth: borderWidth)
            content
                .padding(contentPadding)
        }
        .shadow(radius: shadwoRadius)
    }
}

#Preview {
    Card {
        Text("Tello")
    }
    .padding(20)
}
