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
            HStack(spacing: 16) {
                ForEach(state.productSuggestions, id: \.self) {
                    ResultButton($0) {

                    }
                    // TODO: Use background property  (tuple/struct?)
                    .background($0 == state.selectedSuggestion ? .selectedProduct : .clear)
                }
            }
            SelectionIndicator(selection: state.isCorrectProductSelected)
            Spacer()
            SubmitButton(state.continueButtonTitle) {

            }
            // TODO: invert the isContinueButtonEnabled property
            .disabled(state.isContinueButtonEnabled == false)
        }
        .background(Color.background)
        .padding()
    }
}

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"]))
}

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"],
                                                    isContinueButtonEnabled: true,
                                                    isCorrectProductSelected: true,
                                                    selectedSuggestion: "72"))
}

#Preview {
    MultiplicationExerciseView(viewState: ViewState(operation: "9 x 8",
                                                    productSuggestions: ["71", "72", "75"],
                                                    isContinueButtonEnabled: true,
                                                    isCorrectProductSelected: false,
                                                    selectedSuggestion: "71"))
}

#if DEBUG

extension MultiplicationExerciseView {

    init(viewState: ViewState) {
        let viewAdapter = ViewAdapter()
        viewAdapter.state = viewState

        self.init(viewAdapter: viewAdapter)
    }

}
#endif
