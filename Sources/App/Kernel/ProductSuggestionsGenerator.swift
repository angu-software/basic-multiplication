//
//  ProductSuggestionsGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ProductSuggestionsGenerator {

    private static let maxDistanceFromCorrectProduct = 3

    private let numberOfSuggestions: Int
    private let maxSuggestionRange: ClosedRange<Int>
    private let maxDistanceToProduct: Int

    init(numberOfSuggestions: Int,
         maxSuggestionRange: ClosedRange<Int>,
         maxDistanceToProduct: Int) {
        self.numberOfSuggestions = numberOfSuggestions
        self.maxSuggestionRange = maxSuggestionRange
        self.maxDistanceToProduct = maxDistanceToProduct
    }

    func makeSuggestions(product: Int) -> [Int] {
        let suggestionRange = suggestionRange(for: product,
                                              maxDistance: maxDistanceToProduct)
        let suggestions = makeProductSuggestions(wrongProductRange: suggestionRange,
                                                 correctProduct: product)
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
