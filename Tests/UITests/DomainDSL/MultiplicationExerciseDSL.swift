//
//  MultiplicationExerciseDSL.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 11.10.24.
//

final class MultiplicationExerciseDSL {

    enum SolutionSelection {
        case any
        case wrong
    }

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

    func selectSolution(_ selection: SolutionSelection = .any) throws {
        var suggestion: Int?

        switch selection {
        case .any:
            suggestion = offeredSolutions.randomElement()
        case .wrong:
            let correctSolution = operation!.0 * operation!.1
            let wrongSolutions = offeredSolutions.filter { $0 != correctSolution }
            suggestion = wrongSolutions.randomElement()
        }

        guard let suggestion else {
            throw ProtocolDriverError("Solution suggestions not found")
        }

        protocolDriver.tapSuggestion("\(suggestion)")
    }

    func assertSelectionFeedback() {

    }
}
