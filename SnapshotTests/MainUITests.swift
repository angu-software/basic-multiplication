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
        let view = ContentView()
        assertSnapshot(of: view, as: .image(drawHierarchyInKeyWindow: true,
                                            layout: .device(config: .iPhone13Mini),
                                            traits: .init(userInterfaceStyle: .light)))
    }
}
