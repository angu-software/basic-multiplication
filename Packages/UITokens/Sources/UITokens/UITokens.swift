// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum SizeToken: CGFloat {

    /*
     XS (16pt): For very small UI elements, such as tiny icons.
     S (24pt): Suitable for small buttons, labels, or smaller icons.
     M (32pt): Ideal for standard icon sizes or compact buttons.
     L (48pt): Common size for main buttons, smaller cards, or medium-sized images.
     XL (64pt): Great for primary images, larger buttons, or card elements.
     XXL (80pt): For large visuals like hero images or prominent buttons.
     XXXL (96pt)
    */

    /// 64pt
    case xl = 64
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
