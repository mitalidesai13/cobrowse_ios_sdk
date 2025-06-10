// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BlitzzCobrowseSDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BlitzzCobrowseSDK",
            targets: ["BlitzzCobrowseSDK"])
    ],
    targets: [
        // Only the binary target (no source files)
        .binaryTarget(
            name: "BlitzzCobrowseSDK",
            path: "BlitzzCobrowseSDK.xcframework"
        )
    ]
)