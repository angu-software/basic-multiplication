//
//  MultiplicationExerciseView.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

struct MultiplicationExerciseView: View {

    @StateObject
    var viewAdapter = ViewAdapter()

    private var state: ViewState {
        return viewAdapter.state
    }

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            Label(state.operation)
                .accessibilityElement()
                .accessibilityIdentifier("operation")
            HStack(spacing: 16) {
                ForEach(state.suggestionSelection, id: \.value) { suggestion in
                    ResultButton(suggestion.value,
                                 isSelected: suggestion.isSelected) {
                        viewAdapter.didSelectSuggestion(suggestion.value)
                    }
                }
                .accessibilityElement()
                .accessibilityIdentifier("suggestions")
            }
            SelectionIndicator(selection: state.isCorrectProductSelected)
            Spacer()
            SubmitButton(state.continueButtonTitle) {
                viewAdapter.didTapContinueButton()
            }
            .disabled(state.isContinueButtonDisabled)
        }
        .background(Color.background)
        .padding()
    }
}

#if DEBUG

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"]))
}

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"],
                                                    isContinueButtonDisabled: false,
                                                    isCorrectProductSelected: true,
                                                    selectedSuggestion: "72"))
}

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"],
                                                    isContinueButtonDisabled: false,
                                                    isCorrectProductSelected: false,
                                                    selectedSuggestion: "71"))
}

extension MultiplicationExerciseView {

    init(viewState: ViewState) {
        let viewAdapter = ViewAdapter()
        viewAdapter.state = viewState

        self.init(viewAdapter: viewAdapter)
    }

}
#endif
