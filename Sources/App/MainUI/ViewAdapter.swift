//
//  ViewAdapter.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftUI

@MainActor
final class ViewAdapter: ObservableObject {

    @Published
    var state: ViewState

    convenience init() {
        self.init(state: ViewState(multiplicand: 1,
                                   multiplier: 1,
                                   productSuggestions: [1, 9, 6]))
    }

    init(state: ViewState) {
        self.state = state
    }
}
