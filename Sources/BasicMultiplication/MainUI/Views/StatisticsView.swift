//
//  StatisticsView.swift
//  Basic Multiplication
//
//  Created by Mistral Vibe on 21.09.26.
//

import SwiftUI

import UITokens

struct StatisticsView: View {

    let correctCount: Int
    let wrongCount: Int

    var body: some View {
        HStack(spacing: SpacingToken.medium.rawValue) {
            HStack(spacing: SpacingToken.tiny.rawValue) {
                Image(systemName: "checkmark")
                    .foregroundStyle(.correctSelection)
                Text("Correct: ")
                Text(String(correctCount))
                    .bold()
            }

            HStack(spacing: SpacingToken.tiny.rawValue) {
                Image(systemName: "xmark")
                    .foregroundStyle(.wrongSelection)
                Text("Wrong: ")
                Text(String(wrongCount))
                    .bold()
            }
        }
    }
}

#Preview {
    StatisticsView(correctCount: 15, wrongCount: 5)
        .padding(20)
}

#Preview {
    StatisticsView(correctCount: 0, wrongCount: 0)
        .padding(20)
}

#Preview {
    StatisticsView(correctCount: 10, wrongCount: 0)
        .padding(20)
}

#Preview {
    StatisticsView(correctCount: 15, wrongCount: 5)
        .padding(20)
        .preferredColorScheme(.dark)
}
