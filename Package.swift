// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDSOrientationAdaptiveStack",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SDSOrientationAdaptiveStack",
            targets: ["SDSOrientationAdaptiveStack"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "ViewInspector", url: "https://github.com/nalexn/ViewInspector",  .upToNextMajor(from: "0.7.7"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SDSOrientationAdaptiveStack",
            dependencies: []),
        .testTarget(
            name: "SDSOrientationAdaptiveStackTests",
            dependencies: ["SDSOrientationAdaptiveStack", "ViewInspector"]),
    ]
)
