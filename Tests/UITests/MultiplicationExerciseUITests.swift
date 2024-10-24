//
//  MultiplicationExerciseUITests.swift
//  UITests
//
//  Created by Andreas Guenther on 20.09.24.
//

import XCTest

/* Acceptance tests */

@MainActor
final class MultiplicationExerciseUITests: XCTestCase {

    // When selecting a suggestion

    private lazy var robot = MultiplicationExerciseRobot()
    private var exercise: MultiplicationExerciseDSL!

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false

        exercise = MultiplicationExerciseDSL(protocolDriver: robot)
    }

    override func tearDownWithError() throws {
        robot.terminateApp()

        try super.tearDownWithError()
    }

    /* Given: A random multiplication exercise with offered solutions
     * When: The user selects the correct solution
     * Then: It shows that the selection was correct
     */
    func test_it_shows_that_the_correct_suggestion_was_selected() throws {
        try exercise.showsRandomExerciseWithOfferedSolutions()

        try exercise.selectSolution(.correct)

        exercise.assertSelectionFeedback(.correct)
    }

    /* Given: A random multiplication exercise with offered solutions
     * When: The user selects the wrong solution
     * Then: It shows that the selection was wrong
     */
    func test_it_shows_that_the_wrong_suggestion_was_selected() throws {
        try exercise.showsRandomExerciseWithOfferedSolutions()

        try exercise.selectSolution(.wrong)

        exercise.assertSelectionFeedback(.wrong)
    }

    /* Given: A random multiplication exercise with offered solutions
     * When: The user proceeds to the next exercise
     * Then: A new exercise is presented to the user
     */
    func test_it_generates_a_new_exercise_when_tapping_continue() throws {
        try exercise.showsRandomExerciseWithOfferedSolutions()

        try exercise.selectSolution()
        try exercise.proceedToNextExercise()

        exercise.assertNewExerciseIsShown()
    }
}
