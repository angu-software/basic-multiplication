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

        private var multiplicand = 3
        private var multiplier   = 4
        private var maxDistance  = 3

        private var correctProduct = 12
        private var suggestionRange = (9...15)
        private var numberOfSuggestions = 3
        private var numberOfCorrectSuggestions = 1

        private func subject() -> [Int] {
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

        // suggestions should not greater than 100
        // suggestions on edged of number range are still 3
        // suggestions on edged of number range are unique
    }
}
