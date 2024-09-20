//
//  ContentView.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            HStack() {
                Label("1")
                Label("x")
                Label("1")
            }
            HStack(spacing: 16) {
                ResultButton(1) {

                }
                ResultButton(9) {

                }
                ResultButton(6) {

                }
            }
            Spacer()
            SubmitButton("Next") {

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
