//
//  NumberGeneratorTests.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

struct NumberGeneratorTests {

    static func subject() -> NumberGenerator {
        return NumberGenerator()
    }

    @Suite("When generating a number")
    struct GeneratingNumber {

        @Test("it returns a number in the default range")
        func it_returns_a_number_in_the_default_range() async throws {
            #expect(NumberGenerator.defaultRange.contains(subject().getRandomNumber()))
        }
    }

    @Suite("When generating a number with custom range")
    struct GeneratingNumberWithCustomRange {

        @Test("it returns a number in the specified range")
        func it_returns_a_number_in_the_specified_range() async throws {
            let customRange = 0...3

            #expect(customRange.contains(subject().getRandomNumber(range: customRange)))
        }
    }
}
