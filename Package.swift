// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MailerLiteApiClient",
    platforms: [
        .macOS(.v10_15), .iOS(.v15), .tvOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MailerLiteApiClient",
            targets: ["MailerLiteApiClient"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MailerLiteApiClient"),
        .testTarget(
            name: "MailerLiteApiClientTests",
            dependencies: ["MailerLiteApiClient"]),
    ]
)
