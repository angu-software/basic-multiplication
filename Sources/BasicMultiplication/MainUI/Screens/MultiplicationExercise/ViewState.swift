//
//  ViewState.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct ViewState: Equatable {

    typealias Selection = SelectionIndicator.Selection

    let layout = Layout()

    let operation: String
    let productSuggestions: [String]
    let continueButtonTitle = Texts.continueButtonTitle

    var isContinueButtonDisabled = true
    var selection: Selection = .notChosen
    var selectedSuggestion: String?

    var isContinueButtonEnabled: Bool {
        get {
            return !isContinueButtonDisabled
        }
        set {
            isContinueButtonDisabled = !newValue
        }
    }
    var suggestionSelection: [(value: String, isSelected: Bool)] {
        return productSuggestions.map { ($0, $0 == selectedSuggestion) }
    }
}
