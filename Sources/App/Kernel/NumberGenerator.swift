//
//  NumberGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct NumberGenerator {

    static let defaultRange = 0...10

    private let range: ClosedRange<Int>

    init(range: ClosedRange<Int> = defaultRange) {
        self.range = range
    }

    func getRandomNumber() -> Int {
        return .random(in: range)
    }
}
