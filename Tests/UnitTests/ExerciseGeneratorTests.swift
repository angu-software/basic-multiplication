//
//  ExerciseGeneratorTests.swift
//  Basic MultiplicationTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

struct ExerciseGeneratorTests {

    @Suite("When creating a multiplication exercise")
    struct CreatingExercise {
        private let expectedRange = 0...10

        @Test("it returns a random multiplicand in a defined range")
        func it_returns_a_random_multiplicand_in_a_defined_range() async throws {
            let exercise = ExerciseGenerator.makeMultiplication()

            #expect(expectedRange.contains(exercise.multiplicand))
        }

        @Test("it returns a random multiplier in a defined range")
        func it_returns_a_random_multiplier_in_a_defined_range() async throws {
            let exercise = ExerciseGenerator.makeMultiplication()

            #expect(expectedRange.contains(exercise.multiplier))
        }

        @Test("it returns three product suggestions")
        func it_returns_three_product_suggestions() async throws {
            let exercise = ExerciseGenerator.makeMultiplication()

            #expect(exercise.suggestedProducts.count == 3)
        }

        @Test("it returns the correct product among the suggested ones")
        func it_returns_the_correct_product_among_the_suggested_ones() async throws {
            let exercise = ExerciseGenerator.makeMultiplication(multiplicand: 3, multiplier: 4)

            #expect(exercise.suggestedProducts.contains(12))
        }
    }
}
