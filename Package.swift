// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bartender3KeyMaker",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/IBM-Swift/BlueRSA", from: "1.0.0"),
        .package(url: "https://github.com/norio-nomura/Base32", from: "0.5.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Bartender3KeyMaker",
            dependencies: ["CryptorRSA", "Base32"]),
        .testTarget(
            name: "Bartender3KeyMakerTests",
            dependencies: ["Bartender3KeyMaker"]),
    ]
)
