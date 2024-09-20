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

        @Test("it should have wrong suggestions which are not below a max distance from the right product")
        func should_have_wrong_suggestions_which_are_not_below_a_max_distance_from_the_right_product() async throws {
            let suggestions = ProductSuggestionsGenerator.makeSuggestions(multiplicand: 3,
                                                                          multiplier: 4,
                                                                          maxDistance: 3)

            let wrongProducts = suggestions.filter({ $0 != 12 })
            let suggestionsBelow = wrongProducts.filter({ $0 < 12 })

            #expect(suggestionsBelow.allSatisfy({ (9...11).contains($0) }))
        }

        @Test("it should have wrong suggestions which are not above a max distance from the right product")
        func should_have_wrong_suggestions_which_are_not_above_a_max_distance_from_the_right_product() async throws {
            let suggestions = ProductSuggestionsGenerator.makeSuggestions(multiplicand: 3,
                                                                          multiplier: 4,
                                                                          maxDistance: 3)

            let wrongProducts = suggestions.filter({ $0 != 12 })
            let suggestionsAbove = wrongProducts.filter({ $0 > 12 })

            #expect(suggestionsAbove.allSatisfy({ (13...15).contains($0) }))
        }

        // suggestions should not greater than 100
        // suggestions should not less than 0
    }
}
