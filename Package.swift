// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AdaptiveKit",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "AdaptiveKit", targets: ["AdaptiveKit"])
    ],
    targets: [
        .binaryTarget(
          name: "AdaptiveKit",
          url: "https://github.com/Futurae-Technologies/ios-adaptive-sdk/releases/download/v1.0.1-alpha/AdaptiveKit-v1.0.1.xcframework.zip",
          checksum: "432956f7160743bdad739ee9703c12d9509229a79e450fbc6d9d31678ed9c729"
        )
    ]
)