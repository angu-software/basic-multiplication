//
//  ExerciseGeneratorTests.swift
//  Basic MultiplicationTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

@Suite("ExerciseGenerator")
struct ExerciseGeneratorTests {

    @Suite("When creating a multiplication exercise")
    struct CreatingExercise {
        private let expectedRange = NumberGenerator.defaultRange

        @Test("it should have a random multiplicand in a defined range")
        func should_generate_multiplication_exercise_with_random_multiplicand() async throws {
            let exercise = ExerciseGenerator.makeMultiplication()

            #expect(expectedRange.contains(exercise.multiplicand))
        }

        @Test("it should have a random multiplier in a defined range")
        func should_generate_multiplication_exercise_with_random_multiplier() async throws {
            let exercise = ExerciseGenerator.makeMultiplication()

            #expect(expectedRange.contains(exercise.multiplier))
        }

        @Test("it should suggest three products")
        func should_suggest_three_products() async throws {
            let exercise = ExerciseGenerator.makeMultiplication()

            #expect(exercise.suggestedProducts.count == 3)
        }

        @Test("it should have the correct product among the suggested products")
        func should_have_the_correct_product_among_the_suggested_products() async throws {
            let exercise = ExerciseGenerator.makeMultiplication(multiplicand: 3, multiplier: 4)

            #expect(exercise.suggestedProducts.contains(12))
        }
    }
}
