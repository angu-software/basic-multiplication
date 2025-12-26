//
//  CardButton.swift
//  One Times One
//
//  Created by Andreas Günther on 26.12.25.
//

import SwiftUI

struct CardButton<Content: View>: View {

    private let shadowRadius: CGFloat = 0
    private let boderColor = Color.gray

    @ViewBuilder var content: Content

    var body: some View {
        Button {
            // no-op
        } label: {
            Card(shadwoRadius: shadowRadius,
                 borderColor: boderColor) {
                content
            }
        }
    }
}

#Preview {
    CardButton {
        Text("Placeholder")
    }
        .padding(20)
}
