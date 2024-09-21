//
//  ItMacro.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 21.09.24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ItMacro: DeclarationMacro {

    enum Error: Swift.Error {
        case missingMethodName
        case missingBody
    }

    // MARK: - DeclarationMacro

    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard let body = node.trailingClosure else {
            throw Error.missingBody
        }

        return [#"""
                @Test("it should do something")
                func it_should_do_something() async throws
                \#(body)
                """#]
    }
}
