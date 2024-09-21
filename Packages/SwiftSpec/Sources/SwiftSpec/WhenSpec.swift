// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  WhenSpec.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 21.09.24.
//

#if canImport(Testing)
@freestanding(declaration, names: arbitrary)
public macro when(_ label: StaticString, _ body: () -> Void) = #externalMacro(module: "SwiftSpecMacros",
                                                                              type: "WhenMacro")
#endif
