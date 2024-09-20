//
//  ProductSuggestionsGenerator.swift
//  UnitTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

@testable import Basic_Multiplication

@Suite("ProductSuggestionsGeneratorTests")
struct ProductSuggestionsGeneratorTests {

    @Suite("When generating product suggestions")
    struct GeneratingProductSuggestions {

        @Test("it should generate three suggestions")
        func should_generate_three_suggestions() async throws {
            let suggestions = ProductSuggestionsGenerator.makeSuggestions(multiplicand: 3,
                                                                          multiplier: 4)

            #expect(suggestions.count == 3)
        }

        @Test("it should have one correct product among the suggestions")
        func should_have_only_one_correct_product_among_the_suggestions() async throws {
            let suggestions = ProductSuggestionsGenerator.makeSuggestions(multiplicand: 3,
                                                                          multiplier: 4)

            let correctProductCount = try #require(suggestions.count(where: { $0 == 12 }))

            #expect(correctProductCount == 1)
        }

        @Test("it should have suggestions in defined range from correct product")
        func should_should_have_suggestions_in_defined_range_from_correct_product() async throws {
            let suggestions = ProductSuggestionsGenerator.makeSuggestions(multiplicand: 3,
                                                                          multiplier: 4,
                                                                          maxDistance: 3)

            let wrongProducts = suggestions.filter({ $0 != 12 })

            #expect(wrongProducts.allSatisfy({ (9...15).contains($0) }))
        }

        // suggestions should not greater than 100
        // suggestions should not less than 0
        // suggestions should be unique. no same values
        // correct product should be randomly placed in suggestions
    }
}
