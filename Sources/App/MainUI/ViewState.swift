//
//  ViewState.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ViewState: Equatable {

    let operationSymbol = "x"
    let continueButtonText = "Next"

    var multiplicand: Int
    var multiplier: Int

    var productSuggestions: [Int]

    var isContinueButtonEnabled = false
}
