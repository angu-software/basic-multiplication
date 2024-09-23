//
//  ViewAdapterTests.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 23.09.24.
//

import Testing

@testable import Basic_Multiplication

struct ViewAdapterTests {

    private static let configuration = ViewAdapter.Configuration.numberRangeUpTo100()

    @MainActor
    private static func viewAdapter() -> ViewAdapter {
        return ViewAdapter(configuration: configuration)
    }

    @MainActor
    @Suite("When creating a new exercise")
    struct WhenCreatingANewExercise {

        private let subject: ViewAdapter

        init() {
            subject = ViewAdapterTests.viewAdapter()
            subject.makeNewExercise()
        }

        @Test("it creates a view state with operants in the configurations operand range")
        func it_creates_a_view_state_with_operants_in_the_configurations_operand_range() async throws {
            let operandRange = ViewAdapterTests.configuration.operandRange
            let multiplicand = subject.state.multiplicand
            let multiplier = subject.state.multiplier

            #expect(operandRange.contains(multiplicand))
            #expect(operandRange.contains(multiplier))
        }

        @Test("it creates the configured amount of suggestions")
        func it_creates_the_configured_amount_of_suggestions() async throws {
            let numberOfSuggestions = ViewAdapterTests.configuration.numberOfSuggestions

            #expect(subject.state.productSuggestions.count == numberOfSuggestions)
        }
    }

    @MainActor
    @Suite("When a suggestion is selected")
    struct WhenASuggestionIsSelected {

        private let subject: ViewAdapter

        init() {
            subject = ViewAdapterTests.viewAdapter()
            subject.makeNewExercise()
        }

        @Test("it stores the selected suggestion")
        func it_stores_the_selected_suggestion() async throws {
            let selectionIndex = 1
            subject.selectSuggestion(at: selectionIndex)

            #expect(subject.selectedSuggestion == subject.state.productSuggestions[selectionIndex])
        }

        @Test("it enables the continue button")
        func it_enables_the_continue_button() async throws {
            subject.selectSuggestion(at: 1)

            #expect(subject.state.isContinueButtonEnabled == true)
        }

        @Test("it prevents from selecting another suggestion")
        func it_prevents_from_selection_another_suggestion() async throws {
            subject.selectSuggestion(at: 1)
            let previousSelection = subject.selectedSuggestion

            subject.selectSuggestion(at: 2)

            #expect(subject.selectedSuggestion == previousSelection)
        }

        // indication if selected suggestion is wrong
        // unlock selection with continue button
        // everything is reset when new exercise is generated
    }
}
