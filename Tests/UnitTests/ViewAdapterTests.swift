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

    @MainActor
    @Suite("When a suggestion is selected")
    struct WhenASuggestionIsSelected {

        private let configuration = ViewAdapter.Configuration.numberRangeUpTo100()

        private func subject() -> ViewAdapter {
            let viewAdapter = ViewAdapter(configuration: configuration)
            viewAdapter.makeNewExercise()

            return viewAdapter
        }

        @Test("it stores the selected suggestion")
        func it_stores_the_selected_suggestion() async throws {
            let viewAdapter = subject()
            viewAdapter.didSelectSuggestion(at: 1)

            #expect(viewAdapter.selectedSuggestion == viewAdapter.state.productSuggestions[1])
        }

        @Test("it enables the continue button")
        func it_enables_the_continue_button() async throws {
            let viewAdapter = subject()
            viewAdapter.didSelectSuggestion(at: 1)

            #expect(viewAdapter.state.isContinueButtonEnabled == true)
        }

        @Test("it prevents from selecting another suggestion")
        func it_prevents_from_selection_another_suggestion() async throws {
            let viewAdapter = subject()
            viewAdapter.didSelectSuggestion(at: 1)
            let selectedSuggestion = viewAdapter.selectedSuggestion

            viewAdapter.didSelectSuggestion(at: 2)

            #expect(viewAdapter.selectedSuggestion == selectedSuggestion)
        }
    }
}
