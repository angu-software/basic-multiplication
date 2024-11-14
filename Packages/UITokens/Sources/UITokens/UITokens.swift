// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum SizeToken: CGFloat {

    /*
     Recommended Button Size Ratios

     Primary Button (e.g., CTA buttons)
     Width: Generally 2x to 3x the height, allowing room for longer text.
     Height: Use SizeToken.m or SizeToken.l for a comfortable touch target.
     Example: SizeToken.l height (48pt) with a width of 96–144pt (2:1 to 3:1 ratio).

     Secondary Button (e.g., auxiliary actions)
     Width: 1.5x to 2x the height, allowing for shorter text.
     Height: Use SizeToken.m or SizeToken.s.
     Example: SizeToken.m height (32pt) with a width of 48–64pt.

     Icon Button (e.g., buttons with icons only)
     Width and Height: Same value (square buttons work best).
     Use a single SizeToken value for both width and height, such as SizeToken.s (24pt) or SizeToken.m (32pt).
     Example: SizeToken.m (32pt) width and height.
     */

    // XS (16pt): For very small UI elements, such as tiny icons.
    // S (24pt): Suitable for small buttons, labels, or smaller icons.
    // M (32pt): Ideal for standard icon sizes or compact buttons.
    /// L (48pt): Common size for main buttons, smaller cards, or medium-sized images.
    case l = 48

    /// XL (64pt): Great for primary images, larger buttons, or card elements.
    case xl = 64

    /// XXL (80pt): For large visuals like hero images or prominent buttons.
    case xxl = 80

    // XXXL (96pt) Useful for larger hero elements, wide cards, or full-width banners.
}

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

extension CGSize {

    public init(width: SizeToken, height: SizeToken) {
        self.init(width: width.rawValue,
                  height: height.rawValue)
    }
}
