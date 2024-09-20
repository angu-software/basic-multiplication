//
//  NumberGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum NumberGenerator {

    static let range = 0...10

    static func getRandomNumber() -> Int {
        return .random(in: range)
    }
}
