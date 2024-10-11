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

    init(protocolDriver: MultiplicationProtocolDriver) {
        self.protocolDriver = protocolDriver
    }

    func showsRandomExerciseWithOfferedSolutions() throws {
        protocolDriver.launchApp()
    }
    
    func selectSolution(_ selection: SolutionSelection = .any) throws {
        guard let selectedProduct = try solution(for: selection) else {
            throw ProtocolDriverError("Solution suggestions not found")
        }

        protocolDriver.tapSuggestion("\(selectedProduct)")
    }

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

    private func correctSolution() throws -> Int {
        let operation = try exerciseOperation()

        return operation.0 * operation.1
    }

    private func wrongSolutions() throws -> [Int] {
        let correctSolution = try correctSolution()
        return try offeredSolutions().filter { $0 != correctSolution }
    }

    private func solution(for selection: SolutionSelection) throws -> Int? {
        switch selection {
        case .any:
            return try offeredSolutions().randomElement()
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
        return try protocolDriver.operationProductSuggestions()
    }
}
