//
//  NumberGenerator.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 20.09.24.
//

enum NumberGenerator {

    static func getRandomNumber() -> Int {
        return .random(in: 0...10)
    }
}
