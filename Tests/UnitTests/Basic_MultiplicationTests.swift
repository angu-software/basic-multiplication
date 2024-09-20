//
//  Basic_MultiplicationTests.swift
//  Basic MultiplicationTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

struct Basic_MultiplicationTests {

    @Test func should_generate_random_number_in_range_0_to_10() async throws {
        let number = NumberGenerator.getRandomNumber()

        #expect((0...10).contains(number))
    }
}
