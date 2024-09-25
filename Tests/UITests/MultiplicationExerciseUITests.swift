//
//  MultiplicationExerciseUITests.swift
//  UITests
//
//  Created by Andreas Guenther on 20.09.24.
//

import XCTest

final class MultiplicationExerciseUITests {

    // When selecting a suggestion
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

        // it shows that the correct suggestion was tapped
        @MainActor
        func test_it_shows_that_the_correct_suggestion_was_selected() throws {
            let operation = app.otherElements["operation"]
            let operationLabel = operation.staticTexts.firstMatch
            let label = operationLabel.label

            let operands = label
                .components(separatedBy: "x")
                .compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
            let product = operands[0] * operands[1]

            app.buttons["\(product)"].tap()

            XCTAssert(app.otherElements["correct"].exists)
//            tap(correctProduct)
//            assert(correctnessIndicatorCorrectSelection)
        }

        // it shows that the wrong suggestion was tapped
        // it can generate a new exercise
    }
}
