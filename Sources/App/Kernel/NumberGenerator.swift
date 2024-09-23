//
//  NumberGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct NumberGenerator {

    private let range: ClosedRange<Int>

    init(range: ClosedRange<Int>) {
        self.range = range
    }

    func getRandomNumber() -> Int {
        return .random(in: range)
    }
}
