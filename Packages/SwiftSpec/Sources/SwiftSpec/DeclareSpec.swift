// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  DeclareSpec.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 20.09.24.
//

#if canImport(Testing)
@freestanding(declaration, names: arbitrary)
public macro define(_ label: StaticString, _ body: () -> Void) = #externalMacro(module: "SwiftSpecMacros",
                                                                                type: "DefineMacro")
#endif
