// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewRow",
    products: [
        .library(
            name: "ViewRow",
            targets: ["ViewRow"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xmartlabs/Eureka.git", from: "5.3.2"),
    ],
    targets: [
        .target(
            name: "ViewRow",
            dependencies: ["Eureka"],
            path: "ViewRow",
            exclude: ["Info.plist", "ViewRow.h"]),
    ]
)
