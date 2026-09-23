// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "system_info_plus",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "system-info-plus", targets: ["system_info_plus"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "system_info_plus",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)