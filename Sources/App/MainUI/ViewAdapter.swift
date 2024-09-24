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
    private(set) var selectedSuggestion: Int?

    private var exercise: MultiplicationExercise {
        didSet {
            state = ViewState(exercise: exercise)
        }
    }

    private var correctProduct: Int {
        return exercise.multiplication.product
    }

    convenience init(configuration: Configuration = .numberRangeUpTo100()) {
        let generator = ExerciseGenerator(configuration: configuration)
        self.init(exerciseGenerator: generator,
                  exercise: generator.makeMultiplication())
    }

    private init(exerciseGenerator: ExerciseGenerator,
                 exercise: MultiplicationExercise) {
        self.exerciseGenerator = exerciseGenerator
        self.exercise = exercise
        self.state = ViewState(exercise: exercise)
    }

    func makeNewExercise() {
        exercise = exerciseGenerator.makeMultiplication()
    }

    func selectSuggestion(at index: Int) {
        guard selectedSuggestion == nil else {
            return
        }

        selectedSuggestion = state.productSuggestions[index]

        updateState()
    }

    private func updateState() {
        state.isCorrectProductSelected = correctProduct == selectedSuggestion
        state.isContinueButtonEnabled = true
    }
}

extension ViewState {

    fileprivate init(exercise: MultiplicationExercise) {
        self.init(multiplicand: exercise.multiplicand,
                  multiplier: exercise.multiplier,
                  productSuggestions: exercise.productSuggestions)
    }
}
