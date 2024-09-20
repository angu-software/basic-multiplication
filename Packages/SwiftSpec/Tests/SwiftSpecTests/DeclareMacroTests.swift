//
//  DeclareMacroTests.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(SwiftSpecMacros)
import SwiftSpecMacros
#endif

final class DeclareMacroTests: XCTestCase {

    private var testMacros: [String: Macro.Type] = [:]

    override func setUp() async throws {
        try await super.setUp()

        #if canImport(SwiftSpecMacros)
        testMacros = [
            "declare": DeclareMacro.self,
        ]
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func test_should_expand_to_suite() throws {
        assertMacroExpansion(
            #"""
            #declare("MyType") {
            }
            """#,
            expandedSource: #"""
            @Suite("MyType")
            func MyTypeTests() {
            }
            """#,
            macros: testMacros
        )
    }
}
