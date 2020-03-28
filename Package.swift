// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VanillaMUD",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(name: "TelnetKit", url: "https://github.com/powerje/TelnetKit.git", .branch("blue_sockets")),
    ],
    targets: [
        .target(
            name: "VanillaMUD",
            dependencies: ["TelnetKit"]),
        .testTarget(
            name: "VanillaMUDTests",
            dependencies: ["VanillaMUD"]),
    ]
)

