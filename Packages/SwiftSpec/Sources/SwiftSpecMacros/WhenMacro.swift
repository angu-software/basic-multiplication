//
//  WhenMacro.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 21.09.24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct WhenMacro: DeclarationMacro {

    enum Error: Swift.Error {
        case missingTypeName
        case missingBody
    }

    // MARK: - DeclarationMacro

    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard let body = node.trailingClosure else {
            throw Error.missingBody
        }
        return [#"""
                @Suite("when called")
                struct WhenCalled
                \#(body)
                """#]
    }
}
