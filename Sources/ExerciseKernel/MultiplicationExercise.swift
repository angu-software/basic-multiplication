//
//  MultiplicationExercise.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 24.09.24.
//

struct MultiplicationExercise {

    let multiplication: Multiplication
    let productSuggestions: [Int]

    var multiplicand: Int {
        return multiplication.multiplicand
    }

    var multiplier: Int {
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
