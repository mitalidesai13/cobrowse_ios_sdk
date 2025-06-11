// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "BlitzzCobrowseSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "BlitzzCobrowseSDK",
            targets: ["BlitzzCobrowseSDK"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/moozzyk/SignalR-Client-Swift.git", from: "1.1.0"),
        .package(url: "https://github.com/valpackett/SwiftCBOR", branch: "master")
    ],
    targets: [
        .target(
            name: "BlitzzCobrowseSDK",
            dependencies: [
                .product(name: "SignalRClient", package: "SignalR-Client-Swift"),
                .product(name: "SwiftCBOR", package: "SwiftCBOR")
            ],
            path: "Sources/BlitzzCobrowseSDK"
        )
    ]
)
