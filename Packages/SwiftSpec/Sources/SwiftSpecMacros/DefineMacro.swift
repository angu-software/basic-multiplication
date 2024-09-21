//
//  DeclareMacro.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct DefineMacro: DeclarationMacro {

    enum Error: Swift.Error {
        case missingTypeName
        case missingBody
    }

    // MARK: - DeclarationMacro

    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        let typeName = try getTypeName(node)

        guard let body = node.trailingClosure else {
            throw Error.missingBody
        }

        return [#"""
                @Suite("\#(raw: typeName)")
                struct \#(raw: typeName)Tests
                \#(body)
                """#]
    }

    private static func getTypeName(_ node: some FreestandingMacroExpansionSyntax) throws -> String {
        let arguments = node.arguments
        guard let typeName = arguments.first?.expression.as(StringLiteralExprSyntax.self)?.representedLiteralValue else {
            throw Error.missingTypeName
        }

        return typeName
    }
}
