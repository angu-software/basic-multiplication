//
//  ExerciseGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//


struct ExerciseGenerator {

    static let operandRange = 0...10

    private let operandGenerator = NumberGenerator(range: operandRange)
    private let suggestionGenerator = ProductSuggestionsGenerator()

    func makeMultiplication() -> (multiplicand: Int, multiplier: Int, suggestedProducts: [Int]) {
        let multiplicand = operandGenerator.makeNumber()
        let multiplier = operandGenerator.makeNumber()
        return (multiplicand,
                multiplier,
                suggestionGenerator.makeSuggestions(multiplicand: multiplicand,
                                                    multiplier: multiplier))
    }
}
