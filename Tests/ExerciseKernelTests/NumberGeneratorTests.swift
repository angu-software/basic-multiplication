//
//  NumberGeneratorTests.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

enum NumberGeneratorTests {

    static let operandRange = 0...10

    static func subject(range: ClosedRange<Int> = operandRange) -> NumberGenerator {
        return NumberGenerator(range: range)
    }

    @Suite("When generating a number")
    struct GeneratingNumber {

        @Test("it returns a number in the default range")
        func it_returns_a_number_in_the_default_range() async throws {
            #expect(operandRange.contains(subject().makeNumber()))
        }
    }

    @Suite("When generating a number with custom range")
    struct GeneratingNumberWithCustomRange {

        @Test("it returns a number in the specified range")
        func it_returns_a_number_in_the_specified_range() async throws {
            let customRange = 0...3

            let number = subject(range: customRange).makeNumber()

            #expect(customRange.contains(number))
        }
    }
}
