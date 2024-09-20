// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  DeclareSpec.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 20.09.24.
//

@freestanding(declaration)
public macro declare<T>(_ label: StaticString, body: () -> Void) = #externalMacro(module: "SwiftSpecMacros",
                                                                            type: "DeclareMacro")
