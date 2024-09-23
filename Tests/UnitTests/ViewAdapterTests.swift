//
//  ViewAdapterTests.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 23.09.24.
//

import Testing

@testable import Basic_Multiplication


struct ViewAdapterTests {

    @MainActor
    @Suite("When creating a new exercise")
    struct WhenInitializedWithAConfiguration {

        private let configuration = ViewAdapter.Configuration.numberRangeUpTo100()

        private func subject() -> ViewAdapter {
            let viewAdapter = ViewAdapter(configuration: configuration)
            viewAdapter.makeNewExercise()

            return viewAdapter
        }

        @Test("it creates a view state with operants in the configurations operand range")
        func it_creates_a_view_state_with_operants_in_the_configurations_operand_range() async throws {
            let viewAdapter = subject()

            #expect(configuration.operandRange.contains(viewAdapter.state.multiplicand))
            #expect(configuration.operandRange.contains(viewAdapter.state.multiplier))
        }

        @Test("it creates the configured amount of suggestions")
        func it_creates_the_configured_amount_of_suggestions() async throws {
            let viewAdapter = subject()

            #expect(viewAdapter.state.productSuggestions.count == configuration.numberOfSuggestions)
        }
    }
}
