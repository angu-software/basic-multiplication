//
//  ProtocolDriverError.swift
//  Basic Multiplication
//
//  Created by Andreas Guenther on 11.10.24.
//

struct ProtocolDriverError: Swift.Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }
}
