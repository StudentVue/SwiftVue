// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftVue",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .macCatalyst(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SwiftVue",
            targets: ["SwiftVue"]),
    ],
    targets: [
        .target(
            name: "SwiftVue",
            dependencies: []),
        .testTarget(
            name: "SwiftVueTests",
            dependencies: ["SwiftVue"]),
    ]
)
