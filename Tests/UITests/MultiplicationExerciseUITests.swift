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

        private lazy var robot = MultiplicationExerciseRobot()

        override func setUpWithError() throws {
            try super.setUpWithError()

            continueAfterFailure = false

            robot.launchApp()
        }

        override func tearDownWithError() throws {
            robot.terminateApp()

            try super.tearDownWithError()
        }

        func test_it_shows_that_the_correct_suggestion_was_selected() throws {
            robot.tapSuggestion(robot.operationProduct())

            XCTAssert(robot.correctSolutionIndicator.exists)
        }

        func test_it_shows_that_the_wrong_suggestion_was_selected() throws {
            let operationProduct = robot.operationProduct()
            let wrongSolution = robot.suggestions()
                .first(where: { $0 != operationProduct }) ?? ""

            robot.tapSuggestion(wrongSolution)

            XCTAssert(robot.wrongSolutionIndicator.exists)
        }

        func test_it_generates_a_new_exercise_when_taping_continue() throws {
            let currentSuggestions = robot.suggestions()

            robot.tapSuggestion(robot.operationProduct())
            robot.tap(robot.continueButton)

            XCTAssertNotEqual(robot.suggestions(), currentSuggestions)
        }
    }
}




