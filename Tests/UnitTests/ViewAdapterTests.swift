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
            subject = viewAdapter()
            subject.makeNewExercise()
        }

        @Test("it creates a view state with multiplication operation")
        func it_creates_a_view_state_with_multiplication_operation() async throws {
            let exercise = subject.exercise

            #expect(subject.state.operation == "\(exercise.multiplicand) x \(exercise.multiplier)")
        }

        @Test("it creates the configured amount of suggestions")
        func it_creates_the_configured_amount_of_suggestions() async throws {
            let numberOfSuggestions = configuration.numberOfSuggestions

            #expect(subject.state.productSuggestions.count == numberOfSuggestions)
        }
    }

    @MainActor
    @Suite("When a suggestion is selected")
    struct WhenASuggestionIsSelected {

        private let subject: ViewAdapter

        init() {
            subject = viewAdapter()
            subject.makeNewExercise()
        }

        @Test("it stores the selected suggestion")
        func it_stores_the_selected_suggestion() async throws {
            let selectionIndex = 1
            subject.selectSuggestion(at: selectionIndex)

            #expect(subject.selectedSuggestion == subject.exercise.productSuggestions[selectionIndex])
        }

        @Test("it sets the selected suggestion on the state")
        func it_sets_the_selected_suggestion_on_the_state() async throws {
            let selectionIndex = 1

            subject.selectSuggestion(at: selectionIndex)
            
            let selectedSuggestion = try #require(subject.selectedSuggestion)
            #expect(subject.state.selectedSuggestion == "\(selectedSuggestion)")
        }

        @Test("it enables the continue button")
        func it_enables_the_continue_button() async throws {
            subject.selectSuggestion(at: 1)

            #expect(subject.state.isContinueButtonDisabled == false)
        }

        @Test("it prevents from selecting another suggestion")
        func it_prevents_from_selection_another_suggestion() async throws {
            subject.selectSuggestion(at: 1)
            let previousSelection = subject.selectedSuggestion

            subject.selectSuggestion(at: 2)

            #expect(subject.selectedSuggestion == previousSelection)
        }

        @MainActor
        @Suite("When progressing to the next exercise")
        struct WhenProgressingToTheNextExercise {

            private let subject: ViewAdapter

            init() {
                subject = viewAdapter()
                subject.makeNewExercise()
                subject.selectSuggestion(at: 0)
            }

            @Test("it resets the state")
            func it_resets_the_state() async throws {
                subject.didTapContinueButton()

                #expect(subject.state == ViewState(exercise: subject.exercise))
            }

            @Test("it resets the selection")
            func it_resets_the_selection() async throws {
                subject.didTapContinueButton()

                #expect(subject.selectedSuggestion == nil)
            }
        }
    }

    @MainActor
    @Suite("When the correct suggestion is selected")
    struct WhenTheCorrectSuggestionIsSelected {

        private let subject: ViewAdapter

        init() {
            subject = viewAdapter()
            subject.makeNewExercise()
        }

        @Test("it indicates the selection is correct")
        func it_indicates_the_selection_is_correct() async throws {
            let correctProduct = subject.exercise.multiplication.product
            let correctProductIndex = try #require(subject.exercise.productSuggestions.firstIndex(of: correctProduct))

            subject.selectSuggestion(at: correctProductIndex)

            #expect(subject.state.isCorrectProductSelected == true)
        }
    }
}
