// swift-tools-version:5.5 // IMPORTANT: Use your specific Swift tools version (e.g., 5.7, 5.9 for recent Xcode)
// swift-tools-version:5.9 // Keep this updated (e.g., 5.9 or 5.10)
import PackageDescription

let package = Package(
    name: "BlitzzCobrowseSDK",
    platforms: [.iOS(.v15)], // Or your minimum iOS version
    products: [
        .library(
            name: "BlitzzCobrowseSDK",
            targets: ["BlitzzCobrowseSDKWrapper"]
        )
    ],
    dependencies: [
        // SignalRClient: Set to from: "1.1.0" to match screenshot's rule
        .package(url: "https://github.com/moozzyk/SignalR-Client-Swift.git", from: "1.1.0"), // CHANGED TO 1.1.0

        // SwiftCBOR: Set to .branch("master") to match screenshot's rule
        .package(url: "https://github.com/valpackett/SwiftCBOR", .branch("master")) // CHANGED TO .branch("master")
    ],
    targets: [
        .binaryTarget(
            name: "BlitzzCobrowseSDKBinary",
            path: "BlitzzCobrowseSDK.xcframework"
        ),
        .target(
            name: "BlitzzCobrowseSDKWrapper",
            dependencies: [
                .target(name: "BlitzzCobrowseSDKBinary"),
                .product(name: "SignalRClient", package: "SignalR-Client-Swift"),
                .product(name: "SwiftCBOR", package: "SwiftCBOR")
            ],
            path: "Sources/BlitzzCobrowseSDKWrapper"
        )
    ]
)
