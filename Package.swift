// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let defaultSwiftSettings: [SwiftSetting] =
    [
        .swiftLanguageMode(.v6),
        .enableExperimentalFeature("AvailabilityMacro=hbValkey 1.0:macOS 15.0, iOS 18.0, watchOS 11.0, tvOS 18.0, visionOS 2.0"),
    ]

let package = Package(
    name: "hummingbird-valkey",
    platforms: [.macOS(.v14), .iOS(.v17), .macCatalyst(.v17), .tvOS(.v17), .visionOS(.v1)],
    products: [
        .library(name: "HummingbirdValkey", targets: ["HummingbirdValkey"])
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.5.0"),
        .package(url: "https://github.com/valkey-io/valkey-swift.git", from: "0.5.0"),
    ],
    targets: [
        .target(
            name: "HummingbirdValkey",
            dependencies: [
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "Valkey", package: "valkey-swift"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
        .testTarget(
            name: "HummingbirdValkeyTests",
            dependencies: [
                .byName(name: "HummingbirdValkey"),
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdTesting", package: "hummingbird"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
    ]
)
