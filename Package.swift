// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "BlitzzCobrowseSDK",
    platforms: [.iOS(.v12)], // or .v15 depending on your SDK minimum
    products: [
        .library(
            name: "BlitzzCobrowseSDK",
            targets: ["BlitzzCobrowseSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "BlitzzCobrowseSDK",
            path: "BlitzzCobrowseSDK.xcframework" // <-- local path to the xcframework
        )
    ]
)
