// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VanillaMUD",
    dependencies: [
        .package(url: "https://github.com/powerje/TelnetKit.git", .branch("blue_sockets")),
        .package(url: "https://github.com/Nike-Inc/Willow.git", from: "5.0.2"),
    ],
    targets: [
        .target(
            name: "VanillaMUD",
            dependencies: ["TelnetKit", "Willow"]),
        .testTarget(
            name: "VanillaMUDTests",
            dependencies: ["VanillaMUD"]),
    ]
)

