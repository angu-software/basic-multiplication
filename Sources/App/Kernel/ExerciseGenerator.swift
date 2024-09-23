//
//  ExerciseGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//


enum ExerciseGenerator {

    private static let operandRange = 0...10
    static func makeMultiplication(multiplicand: Int = NumberGenerator(range: operandRange).getRandomNumber(),
                                   multiplier: Int = NumberGenerator(range: operandRange).getRandomNumber()) -> (multiplicand: Int, multiplier: Int, suggestedProducts: [Int]) {
        return (multiplicand,
                multiplier,
                ProductSuggestionsGenerator.makeSuggestions(multiplicand: multiplicand,
                                                            multiplier: multiplier))
    }
}
