//
//  MultiplicationExerciseUITests.swift
//  UITests
//
//  Created by Andreas Guenther on 20.09.24.
//

import XCTest

final class MultiplicationExerciseUITests {

    // When selecting a suggestion
    @MainActor
    final class WhenSelectingASuggestion: XCTestCase {

        private let timeout: TimeInterval = 10
        private var app: XCUIApplication!

        override func setUpWithError() throws {
            try super.setUpWithError()

            continueAfterFailure = false

            app = XCUIApplication()
            app.launch()
            _ = app.wait(for: .runningForeground,
                         timeout: timeout)
        }

        override func tearDownWithError() throws {
            app.terminate()
            _ = app.wait(for: .notRunning,
                         timeout: timeout)

            try super.tearDownWithError()
        }

        func test_it_shows_that_the_correct_suggestion_was_selected() throws {
            tapSuggestion(operationProduct())

            XCTAssert(correctSolutionIndicator.exists)
        }

        func test_it_shows_that_the_wrong_suggestion_was_selected() throws {
            let operationProduct = operationProduct()
            let wrongSolution = suggestions()
                .first(where: { $0 != operationProduct }) ?? ""

            tapSuggestion(wrongSolution)

            XCTAssert(wrongSolutionIndicator.exists)
        }

        func test_it_generates_a_new_exercise_when_taping_continue() throws {
            let currentSuggestions = suggestions()

            tapSuggestion(operationProduct())
            tap(continueButton)

            XCTAssertNotEqual(suggestions(), currentSuggestions)
        }

        // it can generate a new exercise

        // MARK: - API

        private lazy var operationLabel = app.otherElements["operation"].staticTexts.firstMatch
        private lazy var suggestionsList = app.otherElements["suggestions"]
        private lazy var correctSolutionIndicator = app.otherElements["correct"]
        private lazy var wrongSolutionIndicator = app.otherElements["wrong"]
        private lazy var continueButton = app.buttons["Next exercise"]

        private func operation() -> String {
            return operationLabel.label
        }

        private func operationProduct() -> String {
            let operands = operation()
                .components(separatedBy: "x")
                .compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }

            return "\(operands[0] * operands[1])"
        }

        private func suggestions() -> [String] {
            return suggestionsList
                .buttons
                .allElementsBoundByAccessibilityElement
                .map({ $0.label })
        }

        private func tapSuggestion(_ product: String) {
            tap(app.buttons[product])
        }

        private func tap(_ element: XCUIElement) {
            element.tap()
        }
    }
}
