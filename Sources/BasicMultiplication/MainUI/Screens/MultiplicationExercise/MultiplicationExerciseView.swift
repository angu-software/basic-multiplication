//
//  MultiplicationExerciseView.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

import A11yUI

struct MultiplicationExerciseView: View {

    typealias A11yIDs = MultiplicationExerciseScreen.A11IDs

    @ObservedObject
    var viewAdapter = ViewAdapter()

    private var state: ViewState {
        return viewAdapter.state
    }

    private var layout: Layout {
        return state.layout
    }

    var body: some View {
        VStack(spacing: layout.spacingOperationSuggestions) {
            VStack(alignment: .leading,
                   spacing: layout.exerciseNumberSpacing) {
                Text(state.exerciseIdentifier)
                VStack(alignment: .leading,
                       spacing: layout.exerciseStatsSpacing) {
                    Text(state.statsOverallExercises)
                    Text(state.statsCorrectExercises)
                    Text(state.statsWrongExercises)
                }
            }
            Spacer()
            Label(state.operation)
                .accessibilityElement()
                .accessibilityIdentifier("operation")
            HStack(spacing: layout.suggestionElementSpacing) {
                ForEach(state.suggestionSelection, id: \.value) { suggestion in
                    ResultButton(suggestion.value,
                                 isSelected: suggestion.isSelected) {
                        viewAdapter.didSelectSuggestion(suggestion.value)
                    }
                }
                .accessibilityElement()
                .accessibilityIdentifier("suggestions")
            }
            SelectionIndicator(selection: state.selection)
            Spacer()
            SubmitButton(state.continueButtonTitle) {
                viewAdapter.didTapContinueButton()
            }
            .disabled(state.isContinueButtonDisabled)
            .a11yID(A11yIDs.nextExerciseButton)
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
                                                    selection: .correct,
                                                    selectedSuggestion: "72"))
}

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"],
                                                    isContinueButtonDisabled: false,
                                                    selection: .wrong,
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
