//
//  ViewAdapter.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

import MathExercise

@MainActor
final class ViewAdapter: ObservableObject {

    typealias Configuration = ExerciseGenerator.Configuration

    @Published
    var state: ViewState

    private(set) var exerciseNumber: UInt = 1
    private(set) var correctNumberOfSuggestions: UInt = 0
    private(set) var wrongNumberOfSuggestions: UInt = 0

    private let exerciseGenerator: ExerciseGenerator
    private(set) var selectedSuggestion: Int? {
        didSet {
            updateState(for: selectedSuggestion)
        }
    }

    private(set) var exercise: MultiplicationExercise {
        didSet {
            state = ViewState(exercise: exercise)
        }
    }

    private var correctProduct: Int {
        return exercise.multiplication.product
    }

    convenience init(configuration: Configuration = .numberRangeUpTo100) {
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
        selectedSuggestion = nil
        makeNewExercise()
    }

    func makeNewExercise() {
        exercise = exerciseGenerator.makeMultiplication()
        exerciseNumber += 1
    }

    func didSelectSuggestion(_ value: String) {
        guard let index = state.productSuggestions.firstIndex(of: value) else {
            return
        }

        selectSuggestion(at: index)
    }

    private func selectSuggestion(at index: Int) {
        guard selectedSuggestion == nil else {
            return
        }

        selectedSuggestion = exercise.productSuggestions[index]
    }

    private func updateState(for selectedSuggestion: Int?) {
        if let selectedSuggestion {
            if correctProduct == selectedSuggestion {
                state.selection = .correct
                correctNumberOfSuggestions += 1
            } else {
                state.selection = .wrong
                wrongNumberOfSuggestions += 1
            }
            state.selectedSuggestion = "\(selectedSuggestion)"
            state.isContinueButtonDisabled = false
        } else {
            state.selection = .notChosen
            state.selectedSuggestion = nil
            state.isContinueButtonDisabled = true
        }
    }
}

extension ViewState {

    init(exercise: MultiplicationExercise) {
        let operation = String(format: Texts.operationFormat,
                               exercise.multiplicand,
                               exercise.multiplier)
        self.init(operation: operation,
                  productSuggestions: exercise.productSuggestions.map { "\($0)" })
    }
}
