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

    private(set) var selectedSuggestion: Int?
    private let exerciseGenerator: ExerciseGenerator

    private var correctProduct: Int {
        return state.multiplicand * state.multiplier
    }

    init(configuration: Configuration = .numberRangeUpTo100()) {
        self.exerciseGenerator = ExerciseGenerator(configuration: configuration)
        self.state = ViewState(multiplicand: 0,
                               multiplier: 0,
                               productSuggestions: [])
    }

    func makeNewExercise() {
        state = ViewState(multiplication: exerciseGenerator.makeMultiplication())
    }

    func selectSuggestion(at index: Int) {
        guard selectedSuggestion == nil else {
            return
        }

        selectedSuggestion = state.productSuggestions[index]
        state.isCorrectProductSelected = correctProduct == selectedSuggestion
        state.isContinueButtonEnabled = true
    }
}

extension ViewState {

    fileprivate init(multiplication: MultiplicationExercise) {
        self.init(multiplicand: multiplication.multiplicand,
                  multiplier: multiplication.multiplier,
                  productSuggestions: multiplication.productSuggestions)
    }
}
