//
//  ProductSuggestionsGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum ProductSuggestionsGenerator {

    static func makeSuggestions(multiplicand: Int,
                                multiplier: Int) -> [Int] {
        return [1,
                multiplicand * multiplier,
                4]
    }
}
