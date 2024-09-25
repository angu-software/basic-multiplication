//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

import SnapshotTesting
import SwiftUI

@testable import Basic_Multiplication

struct MultiplicationExerciseViewTests {

    @MainActor
    @Suite("When initially shown")
    struct WhenInitiallyShown {

        @Test("it should vertically layout operation and suggestions")
        func it_should_vertically_layout_operation_and_suggestions() async throws {
            let view = MultiplicationExerciseView(viewState: ViewState(operation: "1 x 1",
                                                                       productSuggestions: ["1", "9", "6"]))

            assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true,
                                                layout: .device(config: .iPhone13Mini),
                                                traits: .init(userInterfaceStyle: .light)))
        }
    }

    @MainActor
    @Suite("When the correct suggestion is selected")
    struct WhenTheCorrectSuggestionIsSelected {
        @Test("it indicates the selection is correct")
        func it_indicates_the_selection_is_correct() async throws {
            let state = ViewState(operation: "1 x 1",
                                  productSuggestions: ["1", "9", "6"],
                                  isContinueButtonDisabled: false,
                                  isCorrectProductSelected: true,
                                  selectedSuggestion: "1")

            let view = MultiplicationExerciseView(viewState: state)

            assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true,
                                                layout: .device(config: .iPhone13Mini),
                                                traits: .init(userInterfaceStyle: .light)))
        }
    }

    @MainActor
    @Suite("When the wrong suggestion is selected")
    struct WhenTheWrongSuggestionIsSelected {
        @Test("it indicates the selection is wrong")
        func it_indicates_the_selection_is_wrong() async throws {
            let state = ViewState(operation: "1 x 1",
                                  productSuggestions: ["1", "9", "6"],
                                  isContinueButtonDisabled: false,
                                  isCorrectProductSelected: false,
                                  selectedSuggestion: "9")

            let view = MultiplicationExerciseView(viewState: state)

            assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true,
                                                layout: .device(config: .iPhone13Mini),
                                                traits: .init(userInterfaceStyle: .light)))
        }
    }
}
