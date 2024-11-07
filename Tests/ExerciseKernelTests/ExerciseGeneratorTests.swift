//
//  ExerciseGeneratorTests.swift
//  Basic MultiplicationTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import ExerciseKernel

enum ExerciseGeneratorTests {

    @Suite("When creating a multiplication exercise")
    struct CreatingExercise {

        private let configuration = ExerciseGenerator.Configuration.numberRangeUpTo100

        private var operandRange: ClosedRange<Int> {
            return configuration.operandRange
        }

        private var numberOfSuggestions: Int {
            return configuration.numberOfSuggestions
        }

        private func subject() -> ExerciseGenerator {
            return ExerciseGenerator(configuration: configuration)
        }

        @Test("it returns a random multiplicand in a defined range")
        func it_returns_a_random_multiplicand_in_a_defined_range() async throws {
            let exercise = subject().makeMultiplication()

            #expect(operandRange.contains(exercise.multiplicand))
        }

        @Test("it returns a random multiplier in a defined range")
        func it_returns_a_random_multiplier_in_a_defined_range() async throws {
            let exercise = subject().makeMultiplication()

            #expect(operandRange.contains(exercise.multiplier))
        }

        @Test("it returns three product suggestions")
        func it_returns_three_product_suggestions() async throws {
            let exercise = subject().makeMultiplication()

            #expect(exercise.productSuggestions.count == numberOfSuggestions)
        }
    }
}
