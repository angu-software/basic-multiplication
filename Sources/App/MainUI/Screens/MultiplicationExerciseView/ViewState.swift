//
//  ViewState.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ViewState: Equatable {

    let continueButtonText = "Next"

    let operation: String
    let productSuggestions: [Int]

    var isContinueButtonEnabled = false
    var isCorrectProductSelected: Bool?
}
