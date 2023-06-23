// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AdaptiveKit",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "AdaptiveKit", targets: ["AdaptiveKit"])
    ],
    targets: [
        .binaryTarget(
          name: "AdaptiveKit",
          url: "https://artifactory.futurae.com/artifactory/futurae-ios/AdaptiveKit-v1.0.0-alpha.xcframework.zip",
          checksum: "85c7ac1ccfe27bdf21acd3ce97a3fed4c3ce0380d36628a0c1bfe66ac562963c"
        )
    ]
)
