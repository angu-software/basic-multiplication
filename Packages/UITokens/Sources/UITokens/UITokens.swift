// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum SizeToken: CGFloat {

     // XS (16pt): For very small UI elements, such as tiny icons.
     // S (24pt): Suitable for small buttons, labels, or smaller icons.
     // M (32pt): Ideal for standard icon sizes or compact buttons.
     // L (48pt): Common size for main buttons, smaller cards, or medium-sized images.

     /// XL (64pt): Great for primary images, larger buttons, or card elements.
     case xl = 64

     // XXL (80pt): For large visuals like hero images or prominent buttons.
     // XXXL (96pt) Useful for larger hero elements, wide cards, or full-width banners.
}

public enum Spacing {
    //tiny (4pt): For subtle adjustments, often used sparingly to fine-tune layouts.
    //small (8pt): For minor spacing, like between small icons or text elements.
    //medium (16pt): Standard padding or spacing, suitable for common UI elements.
    //large (24pt): For larger elements or between sections in lists.
    //extraLarge (32pt): Provides significant separation between major components or content groups.
    //huge (40pt): Used for visual separation in high-density layouts or within sections.
    //massive (64pt): Ideal for top-level breaks, creating strong visual hierarchy in dense UIs.

    /// 32pt
    public static let xLarge: CGFloat = 32

    /// 16pt
    public static let medium: CGFloat = 16
}

extension CGSize {

    public init(width: SizeToken, height: SizeToken) {
        self.init(width: width.rawValue,
                  height: height.rawValue)
    }
}
