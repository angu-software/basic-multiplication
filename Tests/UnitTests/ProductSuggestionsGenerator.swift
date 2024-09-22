//
//  ProductSuggestionsGenerator.swift
//  UnitTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

struct ProductSuggestionsGeneratorTests {

    @Suite("When generating product suggestions")
    struct GeneratingProductSuggestions {

        private static let multiplicand = 3
        private static let multiplier   = 4
        private static let maxDistance  = 3

        private let correctProduct = 12
        private let suggestionRange = (9...15)
        private let numberOfSuggestions = 3
        private let numberOfCorrectSuggestions = 1

        private func subject(multiplicand: Int = multiplicand,
                             multiplier: Int = multiplier,
                             maxDistance: Int = maxDistance) -> [Int] {
            ProductSuggestionsGenerator.makeSuggestions(multiplicand: multiplicand,
                                                        multiplier: multiplier,
                                                        maxDistance: maxDistance)
        }

        @Test("it returns three suggestions")
        func it_returns_three_suggestions() async throws {
            #expect(subject().count == numberOfSuggestions)
        }

        @Test("it returns one correct product among the suggestions")
        func it_returns_one_correct_product_among_the_suggestions() async throws {
            let correctProductCount = try #require(subject().count(where: { $0 == correctProduct }))

            #expect(correctProductCount == numberOfCorrectSuggestions)
        }

        @Test("it returns wrong suggestions around the correct product")
        func it_returns_wrong_suggestions_around_the_correct_product() async throws {
            let wrongProducts = subject().filter({ $0 != correctProduct })

            #expect(wrongProducts.allSatisfy({ suggestionRange.contains($0) }))
        }

        @Test("it returns suggestions less than or equal to 100")
        func it_returns_suggestions_less_than_or_equal_to_100() async throws {
            #expect(subject(multiplicand: 100,
                            multiplier: 1).allSatisfy({ $0 <= 100 }))
        }

        // suggestions on edged of number range are still 3
        // suggestions on edged of number range are unique
    }
}
