//
//  NumberGeneratorTests.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

@Suite("NumberGenerator")
struct NumberGeneratorTests {

    @Suite("When generating a number")
    struct GeneratingNumber {
        private let expectedRange = NumberGenerator.range

        @Test("it should be in the expected range")
        func should_generate_random_number_in_expected_range() async throws {
            #expect(expectedRange.contains(NumberGenerator.getRandomNumber()))
        }
    }
}
