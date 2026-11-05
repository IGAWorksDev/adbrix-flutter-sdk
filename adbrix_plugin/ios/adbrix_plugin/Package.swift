// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "adbrix_plugin",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "adbrix-plugin", targets: ["adbrix_plugin"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/IGAWorksDev/adbrix-ios-sdk", from: "3.2.4")
    ],
    targets: [
        .target(
            name: "adbrix_plugin",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "AdbrixSDK", package: "adbrix-ios-sdk")
            ],
            resources: []
        )
    ]
)
