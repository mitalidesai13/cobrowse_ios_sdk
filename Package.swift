// swift-tools-version:5.5 // IMPORTANT: Use your specific Swift tools version (e.g., 5.7, 5.9 for recent Xcode)
import PackageDescription

let package = Package(
    name: "BlitzzCobrowseSDK",
    platforms: [.iOS(.v12)], // Or your minimum iOS version
    products: [
        .library(
            name: "BlitzzCobrowseSDK", // This will be the product name for your actual SDK
            targets: ["BlitzzCobrowseSDKWrapper"] // Point this to your new wrapper target
        )
    ],
    dependencies: [
        .package(url: "https://github.com/moozzyk/SignalR-Client-Swift.git", from: "0.9.0"),
        .package(url: "https://github.com/myfreeweb/SwiftCBOR.git", from: "0.4.4"),
    ],
    targets: [
        // 3. Your actual binary target pointing to the .xcframework
        .binaryTarget(
            name: "BlitzzCobrowseSDKBinary", // Renamed for clarity: this is the *binary*
            path: "BlitzzCobrowseSDK.xcframework"
        ),
        // 4. A wrapper source target that publicly exposes your SDK and declares its dependencies
        .target(
            name: "BlitzzCobrowseSDKWrapper", // This is the target that clients will link
            dependencies: [
                .target(name: "BlitzzCobrowseSDKBinary"), // It depends on your pre-built binary
                .product(name: "SignalRClient", package: "SignalR-Client-Swift"), // Package name from the repo
                .product(name: "SwiftCBOR", package: "SwiftCBOR") // Package name from the repo
            ],
            path: "Sources/BlitzzCobrowseSDKWrapper" // A new, *empty* folder for this wrapper target's source
        )
    ]
)
