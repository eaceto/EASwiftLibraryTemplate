// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let libraryName = "EASwiftLibraryTemplate"
let libraryVersion = "0.0.1"

let package = Package(
    name: libraryName,
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: libraryName,
            targets: [
                libraryName
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: libraryName,
            dependencies: [],
            resources: [
                .process("Resources/")
            ],
            cSettings: [
                .define("\(libraryName)_TARGET".uppercased(), to: libraryName),
                .define("\(libraryName)_VERSION".uppercased(), to: libraryVersion),
            ]
        ),
        .testTarget(
            name: "\(libraryName)Tests",
            dependencies: [
                Target.Dependency.target(name: libraryName)
            ]),
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .c99,
    cxxLanguageStandard: .gnucxx14
)
