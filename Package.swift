// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "Validate",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "Validate",
            targets: ["Validate"]
        ),
    ],
    targets: [
        .target(
            name: "Validate",
            path: "Validate",
            exclude: []
        ),
        .testTarget(
            name: "ValidateTests",
            dependencies: ["Validate"],
            path: "ValidateTests"
        ),
    ]
)
