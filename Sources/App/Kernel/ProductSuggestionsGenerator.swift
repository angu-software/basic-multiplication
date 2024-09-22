//
//  ProductSuggestionsGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum ProductSuggestionsGenerator {

    static func makeSuggestions(multiplicand: Int,
                                multiplier: Int,
                                maxDistance: Int = 3) -> [Int] {
        let correctProduct = multiplicand * multiplier
        let suggestionRange = suggestionRange(for: correctProduct,
                                              maxDistance: maxDistance)
        let suggestions = makeProductSuggestions(range: suggestionRange,
                                                 correctProduct: correctProduct)
        return suggestions.shuffled()
    }

    private static func suggestionRange(for product: Int,
                                        maxDistance: Int) -> ClosedRange<Int> {
        let lowerBound = (product - 1) - maxDistance
        let upperBound = (product + 1) + maxDistance

        return lowerBound...upperBound
    }

    private static func makeProductSuggestions(range: ClosedRange<Int>,
                                               correctProduct: Int) -> [Int] {
        var suggestions: [Int?] = [correctProduct]
        repeat {
            let number = range.randomElement()
            if number != correctProduct {
                suggestions.append(number)
            }
        } while (suggestions.count != 3)

        return suggestions.compactMap { $0 }
    }
}
