// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DanSwiftLib",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DanSwiftLib",
            targets: ["DanSwiftLib"]),
    ],
    dependencies: [
        // Add the AWS SDK package dependency (adjust the URL and version as needed)
        .package(
            url: "https://github.com/aws-amplify/aws-sdk-ios-spm.git",
            from: "2.40.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DanSwiftLib",
            dependencies: [
                           .product(name: "AWSS3", package: "aws-sdk-ios-spm")
                       ]),
    ]
)
