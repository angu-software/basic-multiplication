//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by Andreas Guenther on 20.09.24.
//

import Testing

import SnapshotTesting

@testable import Basic_Multiplication

@MainActor
struct MainUITests {

    @Test func should_show_operation_offered_results_and_submit_button() async throws {
        let viewState = ViewState(multiplicand: 1,
                                  multiplier: 1,
                                  productSuggestions: [1, 9, 6])
        let viewAdapter = ViewAdapter(state: viewState,
                                      configuration: .numberRangeUpTo100())
        let view = ContentView(viewAdapter: viewAdapter)

        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true,
                                            layout: .device(config: .iPhone13Mini),
                                            traits: .init(userInterfaceStyle: .light)))
    }
}
