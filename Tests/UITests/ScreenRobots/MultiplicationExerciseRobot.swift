//
//  MultiplicationExerciseRobot.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 25.09.24.
//

import XCTest

import A11yUITesting

final class MultiplicationExerciseRobot: ScreenRobot {

    private typealias A11IDs = MultiplicationExerciseScreen.A11IDs

    private(set) lazy var operationLabel = app.otherElements["operation"].staticTexts.firstMatch
    private(set) lazy var suggestionsList = app.otherElements["suggestions"]
    private(set) lazy var correctSolutionIndicator = app.otherElements["correct"]
    private(set) lazy var wrongSolutionIndicator = app.otherElements["wrong"]
    private(set) lazy var continueButton = app.buttons[A11IDs.nextExerciseButton]

    func exerciseOperation() throws -> (Int, Int) {
        let operands = operation()
            .components(separatedBy: "x")
            .compactMap { $0.toInt() }
        if operands.count == 2 {
            return (operands[0], operands[1])
        }

        throw ProtocolDriverError("Exercise not found")
    }

    func operationProductSuggestions() throws -> [Int] {
        return suggestionsList
            .buttons
            .allElementsBoundByAccessibilityElement
            .compactMap { $0.label.toInt() }
    }

    func operation() -> String {
        return operationLabel.label
    }

    func operationProduct() -> String {
        let operands = operation()
            .components(separatedBy: "x")
            .compactMap { $0.toInt() }

        return "\(operands[0] * operands[1])"
    }

    func suggestions() -> [String] {
        return suggestionsList
            .buttons
            .allElementsBoundByAccessibilityElement
            .map(\.label)
    }

    func tapSuggestion(_ product: String) {
        tap(app.buttons[product])
    }
}

extension String {

    func toInt() -> Int? {
        return Int(self.trimmed())
    }

    func trimmed() -> Self {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
