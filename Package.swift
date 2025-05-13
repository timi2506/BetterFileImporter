// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "BetterFileImporter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BetterFileImporter",
            targets: ["BetterFileImporter"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BetterFileImporter",
            dependencies: [],
            path: "Sources/BetterFileImporter",
            resources: []
        )
    ]
)
