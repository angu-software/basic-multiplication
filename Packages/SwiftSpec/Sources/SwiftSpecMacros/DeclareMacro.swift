//
//  DeclareMacro.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct DeclareMacro: DeclarationMacro {

    enum Error: Swift.Error {
        case missingArgumentValue
    }

    // MARK: - DeclarationMacro

    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        let typeName = try getTypeName(node: node)

        return [#"""
                @Suite("\#(raw: typeName)")
                func \#(raw: typeName)Tests() {
                }
                """#]
    }

    private static func getTypeName(node: some FreestandingMacroExpansionSyntax) throws -> String {
        let arguments = node.arguments
        guard let typeName = arguments.first?.expression.as(StringLiteralExprSyntax.self)?.representedLiteralValue else {
            throw Error.missingArgumentValue
        }

        return typeName
    }
}
