//
//  AppStoreScreenshots.swift
//  AppStoreScreenshots
//
//  Created by Andreas Guenther on 15.11.24.
//

import XCTest

@MainActor
final class AppStoreScreenshots: XCTestCase {

    private lazy var robot = MultiplicationExerciseRobot()

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false

        setupSnapshot(robot.app)
        robot.launchApp()
    }

    override func tearDownWithError() throws {
        robot.terminateApp()

        try super.tearDownWithError()
    }

    func test_snapshot_no_selection() throws {
        snapshot("test")
    }

//    func test_snapshot_correct_selection() throws {
//
//    }
//
//    func test_snapshot_wrong_selection() throws {
//
//    }
}
