//
//  ProductSuggestionsGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum ProductSuggestionsGenerator {

    static func makeSuggestions(multiplicand: Int,
                                multiplier: Int,
                                maxDistance: Int = 3) -> [Int] {
        let correctProduct = multiplicand * multiplier
        let lowerRange = ClosedRange<Int>(uncheckedBounds: (correctProduct - maxDistance, correctProduct - 1))
        let lowSuggestion = lowerRange.randomElement()!
        let upperRange = ClosedRange<Int>(uncheckedBounds: (correctProduct + 1, correctProduct + maxDistance))
        let upperSuggestion = upperRange.randomElement()!
        return [lowSuggestion,
                correctProduct,
                upperSuggestion].shuffled()
    }
}
