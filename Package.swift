// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Compound",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Compound", targets: ["Compound"])
    ],
    dependencies: [
        .package(url: "https://github.com/vector-im/compound-design-tokens.git", revision: "387d2b7211f07761c67e849c59414a1bb803defa"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.9.0"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", from: "4.1.1"),
        .package(url: "https://github.com/BarredEwe/Prefire", from: "1.5.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.13.0")
    ],
    targets: [
        .target(
            name: "Compound",
            dependencies: [
                .product(name: "CompoundDesignTokens", package: "compound-design-tokens"),
                .product(name: "SwiftUIIntrospect", package: "SwiftUI-Introspect"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
                .product(name: "Prefire", package: "Prefire")
            ],
            plugins: [
                .plugin(name: "PrefirePlaybookPlugin", package: "Prefire")
            ]
        ),
        .testTarget(
            name: "CompoundTests",
            dependencies: [
                "Compound",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            plugins: [
                .plugin(name: "PrefireTestsPlugin", package: "Prefire")
            ]
        )
    ]
)
