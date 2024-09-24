//
//  ViewState.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ViewState: Equatable {

    let continueButtonText = "Next"

    var multiplicand: Int
    var multiplier: Int

    var operation: String {
        return "\(multiplicand) x \(multiplier)"
    }
    var productSuggestions: [Int]

    var isContinueButtonEnabled = false
    var isCorrectProductSelected: Bool?
}
