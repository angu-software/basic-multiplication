// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum Size {

    /*
    Extra Small (4pt): For small elements like icons or very tight spacing.
    Small (8pt): Often used for padding between small elements, text and icons, or small touch targets.
    Medium (16pt): Standard spacing for common UI elements, like padding around buttons.
    Large (24pt): For larger touch targets, like icons or images, and for more generous padding between sections.
    Extra Large (32pt):
    */
}

public enum Spacing {
    /*
    Tiny (4pt): Used sparingly, often for tightly spaced elements.
    Small (8pt): Common for minor spacing adjustments.
    Medium (16pt): Standard spacing between items in a list or between a label and an input.
    Large (24pt): For separating sections or creating space in a dense layout.
    Extra Large (32pt)
     */

    /// 32pt
    public static let xLarge: CGFloat = 32

    /// 16pt
    public static let medium: CGFloat = 16
}
