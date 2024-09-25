//
//  ScreenRobot.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 25.09.24.
//

import XCTest

class ScreenRobot {

    typealias App = XCUIApplication
    typealias UIElement = XCUIElement

    let app: App

    var timeout: TimeInterval = 10

    init(app: App = App()) {
        self.app = app
    }

    @discardableResult
    func launchApp() -> Bool {
        app.launch()

        return app.wait(for: .runningForeground,
                        timeout: timeout)
    }

    @discardableResult
    func terminateApp() -> Bool {
        app.terminate()

        return app.wait(for: .notRunning,
                        timeout: timeout)
    }

    func tap(_ element: UIElement) {
        element.tap()
    }
}
