//
//  A11yID.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

public struct A11yID: Equatable {

    let screenName: String
    let componentType: ComponentType
    let actionOrState: String
    let optionalDetails: String

    public var value: String {
        return [screenName,
                componentType.rawValue,
                actionOrState,
                optionalDetails]
            .filter { $0.isEmpty == false }
            .joined(separator: "_")
    }

    public init(screenName: String,
                componentType: ComponentType,
                actionOrState: String,
                optionalDetails: String = "") {
        self.screenName = screenName
        self.componentType = componentType
        self.actionOrState = actionOrState
        self.optionalDetails = optionalDetails
    }
}
