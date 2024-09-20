//
//  NumberGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum NumberGenerator {

    static let defaultRange = 0...10

    static func getRandomNumber(range: ClosedRange<Int> = defaultRange) -> Int {
        return .random(in: range)
    }
}
