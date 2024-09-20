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

        @Test("it should be in the default range")
        func should_generate_random_number_in_default_range() async throws {
            #expect(NumberGenerator.defaultRange.contains(NumberGenerator.getRandomNumber()))
        }
    }

    @Suite("When generating a number with custom range")
    struct GeneratingNumberWithCustomRange {

        @Test("it should be in the specified range")
        func should_should_be_in_the_specified_range() async throws {
            let customRange = 0...3

            #expect(customRange.contains(NumberGenerator.getRandomNumber(range: customRange)))
        }
    }
}

/**
 * I ideation for a SwiftSpec testing framework based on SwiftTesting and macros
 *
 * ```swift
 *  #define("NumberGenerator") { // overloads with concrete type
 *      #context("getRandomNumber") { // method to test, override with KeyPath
 *          #when("generating number") {
 *              #it("should be in range") {
 *                #expect(...)
 *              }
 *          }
*       }
 *  }
 * ```
 */
