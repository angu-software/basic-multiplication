//
//  MultiplicationExercise.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 24.09.24.
//

public struct MultiplicationExercise {

    public let multiplication: Multiplication
    public let productSuggestions: [Int]

    public var multiplicand: Int {
        return multiplication.multiplicand
    }

    public var multiplier: Int {
        return multiplication.multiplier
    }
}

extension MultiplicationExercise {

    init(multiplicand: Int, multiplier: Int, suggestedProducts: [Int]) {
        self.init(multiplication: Multiplication(multiplicand: multiplicand,
                                                 multiplier: multiplier),
                  productSuggestions: suggestedProducts)
    }
}
