//
//  SwiftSpecPlugin.swift
//  SwiftSpec
//
//  Created by Andreas Guenther on 20.09.24.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SwiftSpecPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DefineMacro.self,
        ContextMacro.self,
        WhenMacro.self,
        ItMacro.self
    ]
}
