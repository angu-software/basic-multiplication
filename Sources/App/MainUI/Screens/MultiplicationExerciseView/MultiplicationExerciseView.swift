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
                    .background($0 == state.selectedSuggestion ? .gray.opacity(0.5) : .white)
                }
            }
            SelectionIndicator(selection: state.isCorrectProductSelected)
            Spacer()
            SubmitButton(state.continueButtonTitle) {

            }
            // TODO: invert the isContinueButtonEnabled property
            .disabled(state.isContinueButtonEnabled == false)
        }
        .padding()
    }
}

struct SelectionIndicator: View {

    struct Style {

        static func correctSelection() -> Self {
            return Self(imageName: "checkmark.seal.fill",
                        imageTint: .green)
        }

        static func wrongSelection() -> Self {
            return Self(imageName: "xmark.seal.fill",
                        imageTint: .orange)
        }

        static func noSelection() -> Self {
            return Self(imageName: "",
                        imageTint: .white)
        }

        let imageName: String
        let imageTint: Color

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
                     imageTint: Color) {
            self.imageName = imageName
            self.imageTint = imageTint
        }
    }

    @State
    var selection: Bool?

    var body: some View {
        let style = Style(selection: selection)
        Image(systemName: style.imageName)
            .resizable()
            .foregroundStyle(style.imageTint)
            .frame(width: 64, height: 64)
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
