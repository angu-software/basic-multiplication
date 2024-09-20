//
//  ExerciseGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//


enum ExerciseGenerator {
    
    static func makeMultiplication() -> (multiplicand: Int, multiplier: Int, suggestedProducts: [Int]) {
        return (NumberGenerator.getRandomNumber(),
                NumberGenerator.getRandomNumber(),
                [1, 2, 3])
    }
}
