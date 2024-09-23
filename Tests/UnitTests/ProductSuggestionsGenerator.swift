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

        private let correctProduct = 12
        private let numberOfSuggestions = 3

        private func subject(multiplicand: Int = 3,
                             multiplier: Int = 4,
                             maxDistance: Int = 3) -> [Int] {
            ProductSuggestionsGenerator().makeSuggestions(multiplicand: multiplicand,
                                                          multiplier: multiplier,
                                                          maxDistance: maxDistance)
        }

        @Test("it returns three suggestions")
        func it_returns_three_suggestions() async throws {
            #expect(subject().count == numberOfSuggestions)
        }

        @Test("it_returns_three_suggestions_on_the_lower_edge_of_the_suggestion_number_range")
        func it_returns_three_suggestions_on_the_lower_edge_of_the_suggestion_number_range() async throws {
            #expect(subject(multiplicand: 0,
                            multiplier: 1).count == numberOfSuggestions)
        }

        @Test("it_returns_three_suggestions_on_the_upper_edge_of_the_suggestion_number_range")
        func it_returns_three_suggestions_on_the_upper_edge_of_the_suggestion_number_range() async throws {
            #expect(subject(multiplicand: 1,
                            multiplier: 100).count == numberOfSuggestions)
        }

        @Test("it returns one correct product among the suggestions")
        func it_returns_one_correct_product_among_the_suggestions() async throws {
            let numberOfCorrectSuggestions = 1

            let correctProductCount = try #require(subject().count(where: { $0 == correctProduct }))

            #expect(correctProductCount == numberOfCorrectSuggestions)
        }

        @Test("it returns wrong suggestions around the correct product")
        func it_returns_wrong_suggestions_around_the_correct_product() async throws {
            let suggestionRange = (9...15)

            let wrongProducts = subject().filter({ $0 != correctProduct })

            #expect(wrongProducts.allSatisfy({ suggestionRange.contains($0) }))
        }

        @Test("it returns suggestions less than or equal to 100")
        func it_returns_suggestions_less_than_or_equal_to_100() async throws {
            #expect(subject(multiplicand: 100,
                            multiplier: 1).allSatisfy({ $0 <= 100 }))
        }

        @Test("it returns suggestions greater than or equal to 0")
        func it_returns_suggestions_greater_than_or_equal_to_0() async throws {
            #expect(subject(multiplicand: 0,
                            multiplier: 1).allSatisfy({ $0 >= 0 }))
        }

        @Test("it returns unique suggestions")
        func it_returns_unique_suggestions() async throws {
            let numberOfUniqueSuggestions = 3

            #expect(Set(subject()).count == numberOfUniqueSuggestions)
        }
    }
}
