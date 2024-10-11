//
//  MultiplicationExerciseDSL.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 11.10.24.
//

final class MultiplicationExerciseDSL {

    private let protocolDriver: MultiplicationProtocolDriver

    private var operation: (Int, Int)?
    private var offeredSolutions: [Int] = []

    init(protocolDriver: MultiplicationProtocolDriver) {
        self.protocolDriver = protocolDriver
    }

    func showsRandomExerciseWithOfferedSolutions() throws {
        // get the current exercise
        operation = try protocolDriver.exerciseOperation()
        offeredSolutions = try protocolDriver.operationProductSuggestions()
    }

    func selectSolution(/*[Any, correct, wrong]*/) {

    }

    func assertSelectionFeedback() {

    }
}
