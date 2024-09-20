//
//  Basic_MultiplicationTests.swift
//  Basic MultiplicationTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

struct Basic_MultiplicationTests {

    private let expectedRange = 0...10

    @Test
    func should_generate_random_number_in_range_0_to_10() async throws {
        let number = NumberGenerator.getRandomNumber()

        #expect(expectedRange.contains(number))
    }

    @Test
    func should_generate_multiplication_exercise_with_random_multiplicand() async throws {
        let exercise = ExerciseGenerator.makeMultiplication()

        #expect(expectedRange.contains(exercise.multiplicand))
    }

    @Test
    func should_generate_multiplication_exercise_with_random_multiplier() async throws {
        let exercise = ExerciseGenerator.makeMultiplication()

        #expect(expectedRange.contains(exercise.multiplier))
    }
}
