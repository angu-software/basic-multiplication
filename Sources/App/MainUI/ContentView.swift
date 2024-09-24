//
//  ContentView.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

struct ContentView: View {

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
                }
            }
            Spacer()
            SubmitButton(state.continueButtonText) {

            }
            .disabled(state.isContinueButtonEnabled == false)
        }
        .padding()
    }
}

#Preview {
    ContentView(viewState: ViewState(multiplicand: 9,
                                     multiplier: 8,
                                     productSuggestions: [71, 72, 75]))
}

#if DEBUG

extension ContentView {

    init(viewState: ViewState) {
        let viewAdapter = ViewAdapter()
        viewAdapter.state = viewState

        self.init(viewAdapter: viewAdapter)
    }

}
#endif
