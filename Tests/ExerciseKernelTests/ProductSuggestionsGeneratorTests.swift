//
//  ProductSuggestionsGeneratorTests.swift
//  UnitTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import ExerciseKernel

enum ProductSuggestionsGeneratorTests {

    @Suite("When generating product suggestions")
    struct GeneratingProductSuggestions {

        private static let correctProduct = 12
        private static let maxSuggestionRange = 0...100

        private let numberOfSuggestions = 3
        private let maxDistanceToProduct = 3

        private func subject(product: Int = correctProduct) -> [Int] {
            return ProductSuggestionsGenerator(numberOfSuggestions: numberOfSuggestions,
                                               maxSuggestionRange: Self.maxSuggestionRange,
                                               maxDistanceToProduct: maxDistanceToProduct)
                .makeSuggestions(product: product)
        }

        @Test("it returns three suggestions",
              arguments: [maxSuggestionRange.lowerBound,
                          correctProduct,
                          maxSuggestionRange.upperBound])
        func it_returns_three_suggestions(for product: Int) async throws {
            #expect(subject(product: product).count == numberOfSuggestions)
        }

        @Test("it returns one correct product among the suggestions")
        func it_returns_one_correct_product_among_the_suggestions() async throws {
            let numberOfCorrectSuggestions = 1

            let correctProductCount = try #require(subject().count { $0 == Self.correctProduct })

            #expect(correctProductCount == numberOfCorrectSuggestions)
        }

        @Test("it returns wrong suggestions around the correct product")
        func it_returns_wrong_suggestions_around_the_correct_product() async throws {
            let suggestionRange = (9...15)

            let wrongProducts = subject().filter { $0 != Self.correctProduct }

            #expect(wrongProducts.allSatisfy { suggestionRange.contains($0) })
        }

        @Test("it returns suggestions less than or equal to upper max suggestion range")
        func it_returns_suggestions_less_than_or_equal_to_upper_max_suggestion_range() async throws {
            #expect(subject(product: Self.maxSuggestionRange.upperBound).allSatisfy { $0 <= 100 })
        }

        @Test("it returns suggestions greater than or equal to lower max suggestion range")
        func it_returns_suggestions_greater_than_or_equal_to_lower_max_suggestion_range() async throws {
            #expect(subject(product: Self.maxSuggestionRange.lowerBound).allSatisfy { $0 >= 0 })
        }

        @Test("it returns unique suggestions")
        func it_returns_unique_suggestions() async throws {
            let numberOfUniqueSuggestions = 3

            #expect(Set(subject()).count == numberOfUniqueSuggestions)
        }
    }
}
