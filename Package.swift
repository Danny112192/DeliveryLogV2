// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DeliveryLog",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DeliveryLog",
            targets: ["DeliveryLog"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.4")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "6.3.0")),
        .package(url: "https://github.com/mapbox/mapbox-maps-ios.git", .upToNextMajor(from: "10.3.0")),
    ],
    targets: [
        .target(
            name: "DeliveryLog",
            dependencies: [
                "Alamofire",
                "SnapKit",
                "Kingfisher",
                .product(name: "MapboxMaps", package: "mapbox-maps-ios")
            ],
            path: "DeliveryLog",
            exclude: ["DeliveryService"]),
        .testTarget(
            name: "DeliveryLogTests",
            dependencies: ["DeliveryLog"]),
    ]
)
