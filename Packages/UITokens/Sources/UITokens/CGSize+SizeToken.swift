//
//  CGSize+SizeToken.swift
//  UITokens
//
//  Created by Andreas Guenther on 14.11.24.
//

import Foundation

extension CGSize {

    public init(width: SizeToken, height: SizeToken) {
        self.init(width: width.rawValue,
                  height: height.rawValue)
    }
}
