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
                    .background($0 == state.selectedSuggestion ? .gray.opacity(0.5) : .white)
                }
            }
            SelectionIndicator(selection: state.isCorrectProductSelected)
                .frame(width: 64, height: 64)
            Spacer()
            SubmitButton(state.continueButtonTitle) {

            }
            .disabled(state.isContinueButtonEnabled == false)
        }
        .padding()
    }
}

struct SelectionIndicator: View {

    var selection: Bool?

    @ViewBuilder
    var body: some View {
        if selection == true {
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .foregroundStyle(.green)
        }
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

#if DEBUG

extension MultiplicationExerciseView {

    init(viewState: ViewState) {
        let viewAdapter = ViewAdapter()
        viewAdapter.state = viewState

        self.init(viewAdapter: viewAdapter)
    }

}
#endif
