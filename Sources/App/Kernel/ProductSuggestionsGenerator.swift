//
//  ProductSuggestionsGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum ProductSuggestionsGenerator {

    private static let numberOfSuggestions = 3
    private static let maxDistanceFormCorrectProduct = 3

    static func makeSuggestions(multiplicand: Int,
                                multiplier: Int,
                                maxDistance: Int = maxDistanceFormCorrectProduct) -> [Int] {
        let correctProduct = multiplicand * multiplier
        let suggestionRange = suggestionRange(for: correctProduct,
                                              maxDistance: maxDistance)
        let suggestions = makeProductSuggestions(range: suggestionRange,
                                                 correctProduct: correctProduct)
        return suggestions.shuffled()
    }

    private static func suggestionRange(for product: Int,
                                        maxDistance: Int) -> ClosedRange<Int> {
        let lowerBound = product - maxDistance
        let upperBound = product + maxDistance

        return lowerBound...upperBound
    }

    private static func makeProductSuggestions(range: ClosedRange<Int>,
                                               correctProduct: Int) -> [Int] {
        var suggestions: [Int?] = [correctProduct]
        repeat {
            let number = range.randomElement() ?? 0
            if number != correctProduct,
               number <= 100,
               number >= 0,
               !suggestions.contains(number) {
                suggestions.append(number)
            }
        } while (suggestions.count != numberOfSuggestions)

        return suggestions.compactMap { $0 }
    }
}
