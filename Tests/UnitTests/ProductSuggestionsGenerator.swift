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

        @Test("it should have the correct product among the suggested products")
        func should_have_the_correct_product_among_the_suggested_products() async throws {
            let suggestions = ProductSuggestionsGenerator.makeSuggestions(multiplicand: 3,
                                                                       multiplier: 4)

            #expect(suggestions.contains(12))
        }
    }
}
