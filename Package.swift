// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestyNetworkAPI",
    platforms: [.iOS("15.0"), .macOS("12")],
    products: [
      
        .library(
            name: "TestyNetworkAPI",
            targets: ["TestyNetworkAPI"]),
    ],
    dependencies: [
  
        .package(url: "https://github.com/swift-biome/swift-documentation-extract", from: "0.2.0"),
    ],
    targets: [
     
        .target(
            name: "TestyNetworkAPI",
            dependencies: []),
        .testTarget(
            name: "TestyNetworkAPITests",
            dependencies: ["TestyNetworkAPI"]),
    ]
)
