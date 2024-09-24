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

    private(set) var exercise: MultiplicationExercise {
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

    func didTapContinueButton() {
        makeNewExercise()
        selectedSuggestion = nil
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

    init(exercise: MultiplicationExercise) {
        let operation = String(format: MultiplicationExerciseView.Texts.operationFormat,
                               exercise.multiplicand,
                               exercise.multiplier)
        self.init(operation: operation,
                  productSuggestions: exercise.productSuggestions)
    }
}
