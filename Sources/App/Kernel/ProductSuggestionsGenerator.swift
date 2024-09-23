//
//  ProductSuggestionsGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ProductSuggestionsGenerator {

    private static let maxDistanceFromCorrectProduct = 3

    private let numberOfSuggestions = 3
    private let maxSuggestionRange = 0...100

    func makeSuggestions(multiplicand: Int,
                         multiplier: Int,
                         maxDistance: Int = maxDistanceFromCorrectProduct) -> [Int] {
        let correctProduct = multiplicand * multiplier
        let suggestionRange = suggestionRange(for: correctProduct,
                                              maxDistance: maxDistance)
        let suggestions = makeProductSuggestions(wrongProductRange: suggestionRange,
                                                 correctProduct: correctProduct)
        return suggestions.shuffled()
    }

    private func suggestionRange(for product: Int,
                                 maxDistance: Int) -> ClosedRange<Int> {
        let lowerBound = product - maxDistance
        let upperBound = product + maxDistance

        return lowerBound...upperBound
    }

    private func makeProductSuggestions(wrongProductRange: ClosedRange<Int>,
                                        correctProduct: Int) -> [Int] {
        let numberGenerator = NumberGenerator(range: wrongProductRange)
        var suggestions: [Int] = [correctProduct]
        repeat {
            let number = numberGenerator.makeNumber()
            if number != correctProduct,
               maxSuggestionRange.contains(number),
               !suggestions.contains(number) {
                suggestions.append(number)
            }
        } while (suggestions.count != numberOfSuggestions)

        return suggestions
    }
}
