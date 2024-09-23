//
//  ExerciseGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//


struct ExerciseGenerator {

    struct Configuration {

        static func numberRangeUpTo100() -> Self {
            Self(operandRange: 0...10,
                 numberOfSuggestions: 3,
                 maxSuggestionRange: 0...100,
                 maxSuggestionDistanceToProduct: 3)
        }

        let operandRange: ClosedRange<Int>
        let numberOfSuggestions: Int
        let maxSuggestionRange: ClosedRange<Int>
        let maxSuggestionDistanceToProduct: Int

        init(operandRange: ClosedRange<Int>,
             numberOfSuggestions: Int,
             maxSuggestionRange: ClosedRange<Int>,
             maxSuggestionDistanceToProduct: Int) {
            self.operandRange = operandRange
            self.numberOfSuggestions = numberOfSuggestions
            self.maxSuggestionRange = maxSuggestionRange
            self.maxSuggestionDistanceToProduct = maxSuggestionDistanceToProduct
        }
    }

    static let operandRange = 0...10
    static let numberOfSuggestions = 3
    static let maxSuggestionRange = 0...100
    static let maxDistanceToProduct = 3

    private let operandGenerator = NumberGenerator(range: operandRange)
    private let suggestionGenerator = ProductSuggestionsGenerator(numberOfSuggestions: numberOfSuggestions,
                                                                  maxSuggestionRange: maxSuggestionRange,
                                                                  maxDistanceToProduct: maxDistanceToProduct)

    func makeMultiplication() -> (multiplicand: Int, multiplier: Int, suggestedProducts: [Int]) {
        let multiplicand = operandGenerator.makeNumber()
        let multiplier = operandGenerator.makeNumber()
        let product = multiplicand * multiplier
        let suggestions = suggestionGenerator.makeSuggestions(product: product)
        return (multiplicand,
                multiplier,
                suggestions)
    }
}
