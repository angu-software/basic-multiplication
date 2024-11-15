//
//  AppStoreScreenshots.swift
//  AppStoreScreenshots
//
//  Created by Andreas Guenther on 15.11.24.
//

import XCTest

// TODO: extract the DSL into its own package and reference in UITests

@MainActor
final class AppStoreScreenshots: XCTestCase {

    private lazy var robot = MultiplicationExerciseRobot()
    private var exercise: MultiplicationExerciseDSL!

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false

        exercise = MultiplicationExerciseDSL(protocolDriver: robot)
        setupSnapshot(robot.app)
        try exercise.showsRandomExerciseWithOfferedSolutions()
    }

    override func tearDownWithError() throws {
        robot.terminateApp()

        try super.tearDownWithError()
    }

    func test_snapshot_no_selection() throws {
        snapshot("0_first_exercise")
    }

    func test_snapshot_correct_selection() throws {
        try exercise.selectSolution(.correct)
        snapshot("1_correct_answer")
    }

    func test_snapshot_wrong_selection() throws {
        try exercise.selectSolution(.wrong)

        snapshot("2_wrong_answer")
    }
}
