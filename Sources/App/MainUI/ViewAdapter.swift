//
//  ViewAdapter.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

@MainActor
final class ViewAdapter: ObservableObject {

    typealias Configuration = ExerciseGenerator.Configuration

    @Published
    var state: ViewState

    private let exerciseGenerator: ExerciseGenerator

    convenience init() {
        self.init(state: ViewState(multiplicand: 1,
                                   multiplier: 1,
                                   productSuggestions: [1, 9, 6]),
                  configuration: .numberRangeUpTo100())
    }

    convenience init(configuration: Configuration) {
        self.init(state: ViewState(multiplicand: 0,
                                   multiplier: 0,
                                   productSuggestions: []),
                  configuration: configuration)
        self.makeNewExercise()
    }

    init(state: ViewState, configuration: Configuration) {
        self.exerciseGenerator = ExerciseGenerator(configuration: configuration)
        self.state = state
    }

    private func makeNewExercise() {
        let multiplication = exerciseGenerator.makeMultiplication()
        state = ViewState(multiplicand: multiplication.multiplicand,
                          multiplier: multiplication.multiplier,
                          productSuggestions: multiplication.suggestedProducts)
    }
}
