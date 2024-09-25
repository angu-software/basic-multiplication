//
//  ViewState.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ViewState: Equatable {

    let operation: String
    let productSuggestions: [String]
    let continueButtonTitle = MultiplicationExerciseView.Texts.continueButtonTitle

    var isContinueButtonEnabled = false
    var isCorrectProductSelected: Bool?
    var selectedSuggestion: String?
}
