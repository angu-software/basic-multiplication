import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(SwiftSpecMacros)
import SwiftSpecMacros
#endif

final class SwiftSpecTests: XCTestCase {

    private var testMacros: [String: Macro.Type] = [:]

    override func setUp() async throws {
        try await super.setUp()

        #if canImport(SwiftSpecMacros)
        testMacros = [
            "stringify": StringifyMacro.self,
            "define": DefineMacro.self,
            "context": ContextMacro.self,
            "when": WhenMacro.self,
            "it": ItMacro.self,
        ]
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacro() throws {
        assertMacroExpansion(
            """
            #stringify(a + b)
            """,
            expandedSource: """
            (a + b, "a + b")
            """,
            macros: testMacros
        )
    }

    func testMacroWithStringLiteral() throws {
        assertMacroExpansion(
            #"""
            #stringify("Hello, \(name)")
            """#,
            expandedSource: #"""
            ("Hello, \(name)", #""Hello, \(name)""#)
            """#,
            macros: testMacros
        )
    }

    func test_should_expand_nested_macros() throws {
        assertMacroExpansion(
            #"""
            #define("MyType") {
                #context("#myMethod") {
                    #when("called") {
                        #it("should do something") {}
                    }
                }
            }
            """#,
            expandedSource: #"""
            @Suite("MyType")
            struct MyTypeTests
            {
                @Suite("#myMethod")
                struct MyMethodContext
                {
                        @Suite("when called")
                        struct WhenCalled
                        {
                                        @Test("it should do something")
                                        func it_should_do_something() async throws
                                        {
                                                                    }
                                    }
                    }
            }
            """#,
            macros: testMacros
        )
    }
}
