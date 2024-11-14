//
//  SpacingToken.swift
//  UITokens
//
//  Created by Andreas Guenther on 14.11.24.
//

import Foundation

public enum SpacingToken: CGFloat {
    //tiny (4pt): For subtle adjustments, often used sparingly to fine-tune layouts.
    //small (8pt): For minor spacing, like between small icons or text elements.

    /// medium (16pt): Standard padding or spacing, suitable for common UI elements.
    case medium = 16

    //large (24pt): For larger elements or between sections in lists.

    /// extraLarge (32pt): Provides significant separation between major components or content groups.
    case extraLarge = 32

    //huge (40pt): Used for visual separation in high-density layouts or within sections.
    //massive (64pt): Ideal for top-level breaks, creating strong visual hierarchy in dense UIs.
}
