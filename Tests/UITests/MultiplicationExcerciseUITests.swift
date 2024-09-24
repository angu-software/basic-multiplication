//
//  MultiplicationExcerciseUITests.swift
//  UITests
//
//  Created by Andreas Guenther on 20.09.24.
//

import XCTest

final class MultiplicationExcerciseUITests {

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
        func it_shows_that_the_correct_suggestion_was_tapped() throws {

        }

        // it shows that the wrong suggestion was tapped
        // it can generate a new exercise
    }
}
