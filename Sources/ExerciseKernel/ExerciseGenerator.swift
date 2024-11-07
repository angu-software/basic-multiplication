//
//  ExerciseGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ExerciseGenerator {

    struct Configuration {

        // swiftlint:disable no_magic_numbers
        static let numberRangeUpTo100 = Self(operandRange: 0...10,
                                             numberOfSuggestions: 3,
                                             maxSuggestionRange: 0...100,
                                             maxSuggestionDistanceToProduct: 3)
        // swiftlint:enable no_magic_numbers

        let operandRange: ClosedRange<Int>
        let numberOfSuggestions: Int
        let maxSuggestionRange: ClosedRange<Int>
        let maxSuggestionDistanceToProduct: Int

        private init(operandRange: ClosedRange<Int>,
                     numberOfSuggestions: Int,
                     maxSuggestionRange: ClosedRange<Int>,
                     maxSuggestionDistanceToProduct: Int) {
            self.operandRange = operandRange
            self.numberOfSuggestions = numberOfSuggestions
            self.maxSuggestionRange = maxSuggestionRange
            self.maxSuggestionDistanceToProduct = maxSuggestionDistanceToProduct
        }
    }

    private let operandGenerator: NumberGenerator
    private let suggestionGenerator: ProductSuggestionsGenerator

    init(configuration: Configuration = .numberRangeUpTo100) {
        operandGenerator = NumberGenerator(range: configuration.operandRange)
        suggestionGenerator = ProductSuggestionsGenerator(numberOfSuggestions: configuration.numberOfSuggestions,
                                                          maxSuggestionRange: configuration.maxSuggestionRange,
                                                          maxDistanceToProduct: configuration.maxSuggestionDistanceToProduct)
    }

    func makeMultiplication() -> MultiplicationExercise {
        let multiplicand = operandGenerator.makeNumber()
        let multiplier = operandGenerator.makeNumber()
        let product = multiplicand * multiplier
        let suggestions = suggestionGenerator.makeSuggestions(product: product)
        return MultiplicationExercise(multiplicand: multiplicand,
                                      multiplier: multiplier,
                                      suggestedProducts: suggestions)
    }
}
