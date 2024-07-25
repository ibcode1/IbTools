// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "IbTools",
  platforms: [
    .iOS(.v17),
    .macOS(.v14)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "IbFoundation",
      targets: ["IbFoundation"]),
    .library(
      name: "IbTools",
      targets: ["IbTools"]),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "IbFoundation"
    ),
    .testTarget(
      name: "IbFoundationTests",
      dependencies: ["IbFoundation"]),
    .target(
      name: "IbTools",
      dependencies: ["IbFoundation"],
      resources: [
        .process("Assets/Fonts/Lexend-ExtraBold.ttf"),
        .process("Assets/Fonts/Lexend-Light.ttf"),
        .process("Assets/Fonts/Lexend-Regular.ttf"),
        .process("Assets/Fonts/Lexend-SemiBold.ttf")
      ]
    ),
    .testTarget(
      name: "IbToolsTests",
      dependencies: [
        "IbTools",
        "IbFoundation"
      ]
    ),
  ]
)
