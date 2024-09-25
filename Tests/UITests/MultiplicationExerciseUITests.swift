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

        // it can generate a new exercise

        // MARK: - API

        private lazy var operationLabel = app.otherElements["operation"].staticTexts.firstMatch
        private lazy var suggestionsList = app.otherElements["suggestions"]
        private lazy var correctSolutionIndicator = app.otherElements["correct"]
        private lazy var wrongSolutionIndicator = app.otherElements["wrong"]

        private func operationProduct() -> String {
            let operands = operationLabel.label
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

        private func tapSuggestion(_ product: String,
                                   file: StaticString = #file,
                                   line: UInt = #line) {
            app.buttons[product].tap()
        }
    }
}
