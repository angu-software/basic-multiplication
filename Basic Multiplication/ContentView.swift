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
            HStack() {
                Text("1")
                Text("x")
                Text("1")
            }
            HStack(spacing: 16) {
                Button("1") {

                }
                .frame(minWidth: 56, minHeight: 42)
                .border(.accent)
                Button("9") {

                }
                .frame(minWidth: 56, minHeight: 42)
                .border(.accent)
                Button("6") {

                }
                .frame(minWidth: 56, minHeight: 42)
                .border(.accent)
            }
            Spacer()
            Button("Next") {

            }
            .frame(maxWidth: .infinity, maxHeight: 64)
            .border(.accent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
