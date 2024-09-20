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

    init() {
        self.state = ViewState(multiplicand: 1,
                               multiplier: 1,
                               availableProducts: [1, 9, 6])
    }
}
