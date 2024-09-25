//
//  MultiplicationExerciseRobot.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 25.09.24.
//

import XCTest

final class MultiplicationExerciseRobot: ScreenRobot {

    private(set) lazy var operationLabel = app.otherElements["operation"].staticTexts.firstMatch
    private(set) lazy var suggestionsList = app.otherElements["suggestions"]
    private(set) lazy var correctSolutionIndicator = app.otherElements["correct"]
    private(set) lazy var wrongSolutionIndicator = app.otherElements["wrong"]
    private(set) lazy var continueButton = app.buttons["Next exercise"]

    func operation() -> String {
        return operationLabel.label
    }

    func operationProduct() -> String {
        let operands = operation()
            .components(separatedBy: "x")
            .compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }

        return "\(operands[0] * operands[1])"
    }

    func suggestions() -> [String] {
        return suggestionsList
            .buttons
            .allElementsBoundByAccessibilityElement
            .map({ $0.label })
    }

    func tapSuggestion(_ product: String) {
        tap(app.buttons[product])
    }
}
