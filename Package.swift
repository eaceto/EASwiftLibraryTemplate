// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let libraryName = "EASwiftLibraryTemplate"
let libraryVersion = "0.0.1"

let package = Package(
    name: libraryName,
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: libraryName,
            targets: [
                libraryName
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: libraryName,
            dependencies: [],
            resources: [
                // .process("Resources/") // Add if your library uses embedded resources
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

// Swift DocC Plugin requires Swift 5.6+
#if swift(>=5.6)
package.dependencies += [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
]
#endif