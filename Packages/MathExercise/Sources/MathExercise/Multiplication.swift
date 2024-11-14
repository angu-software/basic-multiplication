//
//  Multiplication.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 24.09.24.
//

public struct Multiplication {

    let multiplicand: Int
    let multiplier: Int
    public let product: Int

    init(multiplicand: Int, multiplier: Int) {
        self.multiplicand = multiplicand
        self.multiplier = multiplier
        self.product = multiplicand * multiplier
    }
}
