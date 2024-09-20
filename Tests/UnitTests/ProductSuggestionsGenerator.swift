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

        // wrong suggestions should be in certain range from correct suggestion
        // suggestions should not greater than 100
        // suggestions should not less than 0
        // suggestions should be unique. no same values
        // correct product should be randomly placed in suggestions
    }
}
