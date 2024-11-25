//
//  ViewAdapterTests.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 23.09.24.
//

import Testing

@testable import One_Times_One

enum ViewAdapterTests {

    private static let configuration = ViewAdapter.Configuration.numberRangeUpTo100

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
            #expect(subject.state.productSuggestions.count == 3)
        }

        @Test("it increases exercise number")
        func it_increases_exercise_number() async throws {
            #expect(subject.exerciseNumber == 2)
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
                subject.didTapContinueButton()
            }

            @Test("it resets the state")
            func it_resets_the_state() async throws {
                #expect(subject.state == ViewState(exercise: subject.exercise))
            }

            @Test("it resets the selection")
            func it_resets_the_selection() async throws {
                #expect(subject.selectedSuggestion == nil)
            }
        }
    }

    @MainActor
    @Suite("When the correct suggestion is selected")
    struct WhenTheCorrectSuggestionIsSelected {

        private let subject: ViewAdapter

        init() throws {
            subject = viewAdapter()
            subject.makeNewExercise()
            try subject.selectCorrectSuggestion()
        }

        @Test("it indicates the selection is correct")
        func it_indicates_the_selection_is_correct() async throws {
            #expect(subject.state.selection == .correct)
        }

        @Test("it increases the number of correct exercises")
        func it_increases_the_number_of_correct_exercises() async throws {
            #expect(subject.correctNumberOfSuggestions == 1)
        }
    }

    @MainActor
    @Suite("When the wrong suggestion is selected")
    struct WhenTheWrongSuggestionIsSelected {

        private let subject: ViewAdapter

        init() throws {
            subject = viewAdapter()
            subject.makeNewExercise()
            try subject.selectWrongSuggestion()
        }

        @Test("it indicates the selection is wrong")
        func it_indicates_the_selection_is_wrong() async throws {
            #expect(subject.state.selection == .wrong)
        }

        @Test("it increases the number of wrong exercises")
        func it_increases_the_number_of_wrong_exercises() async throws {
            #expect(subject.wrongNumberOfSuggestions == 1)
        }
    }
}

extension ViewAdapter {

    fileprivate func selectCorrectSuggestion() throws {
        let correctProduct = exercise.multiplication.product
        let correctProductIndex = try #require(exercise.productSuggestions.firstIndex(of: correctProduct))

        selectSuggestion(at: correctProductIndex)
    }

    fileprivate func selectWrongSuggestion() throws {
        let correctProduct = exercise.multiplication.product
        let wrongSuggestions = exercise.productSuggestions.filter { $0 != correctProduct }
        let wrongProduct = try #require(wrongSuggestions.randomElement())
        let wrongProductIndex = try #require(exercise.productSuggestions.firstIndex(of: wrongProduct))

        selectSuggestion(at: wrongProductIndex)
    }

    fileprivate func selectSuggestion(at index: Int) {
        let selectedValue = "\(exercise.productSuggestions[index])"
        didSelectSuggestion(selectedValue)
    }
}
