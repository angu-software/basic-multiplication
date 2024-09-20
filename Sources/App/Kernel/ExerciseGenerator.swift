//
//  ExerciseGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//


enum ExerciseGenerator {

    static func makeMultiplication(multiplicand: Int = NumberGenerator.getRandomNumber(),
                                   multiplier: Int = NumberGenerator.getRandomNumber()) -> (multiplicand: Int, multiplier: Int, suggestedProducts: [Int]) {
        return (multiplicand,
                multiplier,
                ProductSuggestionsGenerator.makeSuggestions(multiplicand: multiplicand,
                                                            multiplier: multiplier))
    }
}
