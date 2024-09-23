//
//  NumberGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

struct NumberGenerator {

    static let defaultRange = 0...10

    func getRandomNumber(range: ClosedRange<Int> = defaultRange) -> Int {
        return .random(in: range)
    }
}
