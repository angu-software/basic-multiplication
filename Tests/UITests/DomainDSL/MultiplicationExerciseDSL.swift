//
//  MultiplicationExerciseDSL.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 11.10.24.
//

import XCTest

final class MultiplicationExerciseDSL {

    enum SolutionSelection {
        case any
        case wrong
        case correct
    }

    typealias SolutionFeedback = SolutionSelection

    private let protocolDriver: MultiplicationProtocolDriver

    private var previousOfferedSolutions: [Int] = []
    private var currentOfferedSolutions: [Int] = [] {
        didSet {
            previousOfferedSolutions = oldValue
        }
    }

    init(protocolDriver: MultiplicationProtocolDriver) {
        self.protocolDriver = protocolDriver
    }

    // MARK: Actions

    func showsRandomExerciseWithOfferedSolutions() throws {
        protocolDriver.launchApp()

        try fetchCurrentState()
    }

    func selectSolution(_ selection: SolutionSelection = .any) throws {
        guard let selectedProduct = try solution(for: selection) else {
            throw ProtocolDriverError("Solution suggestions not found")
        }

        protocolDriver.tapSuggestion("\(selectedProduct)")
    }

    func proceedToNextExercise() throws {
        protocolDriver.tap(protocolDriver.continueButton)

        try fetchCurrentState()
    }

    // MARK: Asserts

    func assertSelectionFeedback(_ feedback: SolutionFeedback = .any,
                                 file: StaticString = #file,
                                 line: UInt = #line) {
        let indicator: XCUIElement?

        switch feedback {
        case .any,
             .correct:
            indicator = protocolDriver.correctSolutionIndicator
        case .wrong:
            indicator = protocolDriver.wrongSolutionIndicator
        }

        XCTAssert(indicator?.exists == true,
                  file: file,
                  line: line)
    }

    func assertNewExerciseIsShown(file: StaticString = #file,
                                  line: UInt = #line) {
        XCTAssertNotEqual(currentOfferedSolutions,
                          previousOfferedSolutions,
                          file: file,
                          line: line)
    }

    // MARK: Internals

    private func fetchCurrentState() throws {
        currentOfferedSolutions = try offeredSolutions()
    }

    private func correctSolution() throws -> Int {
        let operation = try exerciseOperation()

        return operation.0 * operation.1
    }

    private func wrongSolutions() throws -> [Int] {
        let correctSolution = try correctSolution()
        return currentOfferedSolutions.filter { $0 != correctSolution }
    }

    private func solution(for selection: SolutionSelection) throws -> Int? {
        switch selection {
        case .any:
            return currentOfferedSolutions.randomElement()
        case .wrong:
            return try wrongSolutions().randomElement()
        case .correct:
            return try correctSolution()
        }
    }

    private func exerciseOperation() throws -> (Int, Int) {
        try protocolDriver.exerciseOperation()
    }

    private func offeredSolutions() throws -> [Int] {
        return  try protocolDriver.operationProductSuggestions()
    }
}
