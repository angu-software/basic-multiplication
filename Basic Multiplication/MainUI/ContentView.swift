//
//  ContentView.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewAdapter = ViewAdapter()

    private var state: ViewState {
        return viewAdapter.state
    }

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            HStack() {
                Label("\(state.multiplicand)")
                Label(state.operationSimbol)
                Label("\(state.multiplier)")
            }
            HStack(spacing: 16) {
                ForEach(0..<3) { index in
                    ResultButton(state.availableProducts[index]) {

                    }
                }
            }
            Spacer()
            SubmitButton(state.submitButtonText) {

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
