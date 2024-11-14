// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "A11y",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "A11y",
            targets: ["A11y"]),
        .library(
            name: "A11yUITesting",
            targets: ["A11yUITesting"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "A11y"),
        .target(name: "A11yUITesting",
                dependencies: [.byName(name: "A11y")]),
        .testTarget(
            name: "A11yTests",
            dependencies: ["A11y"]
        )
    ]
)
