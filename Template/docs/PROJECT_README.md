# LibraryTemplate

[![Swift](https://img.shields.io/badge/Swift-5.5_5.6-yellowgreen?style=flat-square)](https://img.shields.io/badge/Swift-5.5_5.6-yellowgreen?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)

[![Build and tests](https://github.com/eaceto/EASwiftLibraryTemplate/actions/workflows/spm-ci.yml/badge.svg)](https://github.com/eaceto/EASwiftLibraryTemplate/actions/workflows/spm-ci.yml)

[![Create release](https://github.com/eaceto/EASwiftLibraryTemplate/actions/workflows/cd.yml/badge.svg?branch=main)](https://github.com/eaceto/EASwiftLibraryTemplate/actions/workflows/cd.yml)

[![Latest release](https://img.shields.io/badge/Latests%20release-0.0.3-blue.svg)](https://github.com/eaceto/EASwiftLibraryTemplate/releases/tag/0.0.3)

A full documentation of this library, which includes code coverage and code quality, can be found at this repository's GitHub Page [https://eaceto.github.io/EASwiftLibraryTemplate/](https://eaceto.github.io/EASwiftLibraryTemplate/).

## Index

0. [(automatic) CHANGELOG](CHANGELOG.md)
1. [Developing with the library template](README_TEMPLATE_LIBRARY.md)
2. [Requirements](#requirements)
3. [Installation](#installation)
    * [Cocoapods](#cocoapods)
    * [Swift Package Manager](#swift-package-manager)

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.0+ | 5.5 | [CocoaPods](#cocoapods), [Swift Package Manager](#swift-package-manager) | Fully Tested |
| macOS 10.15+ | 5.5 | [CocoaPods](#cocoapods), [Swift Package Manager](#swift-package-manager) | Fully Tested |
| tvOS 13.0+ | 5.5 | [CocoaPods](#cocoapods), [Swift Package Manager](#swift-package-manager) | Fully Tested |
| watchOS 6.0+ | 5.5 | [CocoaPods](#cocoapods), [Swift Package Manager](#swift-package-manager) | Fully Tested |
| Linux | Latest Only | [Swift Package Manager](#swift-package-manager) | Unsupported |
| Windows | Latest Only | [Swift Package Manager](#swift-package-manager) | Unsupported |

## Installation

### Cocoapods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate LibraryTemplate into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'EASwiftLibraryTemplate', '~> <<latest version>>'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding *EASwiftLibraryTemplate* as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/eaceto/EASwiftLibraryTemplate.git", .upToNextMajor(from: "<<latest version>>"))
]
```