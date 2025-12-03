# IbTools – A Clean, Production-Ready Swift Package Template (SPM)

[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![iOS 15+](https://img.shields.io/badge/iOS-15%2B-blue.svg)](https://developer.apple.com/ios/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A lightweight, modular Swift Package designed to jump-start any new iOS project with battle-tested best practices used in my own production apps (PodcastHub etc.).

Everything is deliberately simple, well-documented, and 100% testable — perfect for personal projects, open-source libraries, or as an internal starter kit in a team.

## What's Inside

| Feature                  | Implementation                                  | Why it matters                                      |
|--------------------------|-------------------------------------------------|------------------------------------------------------|
| **Networking**           | `NetworkManager` + reusable `APIClient` protocol | Centralised, mockable, async/await-ready URLSession |
| **Persistence**          | `CoreDataStack` with NSPersistentContainer      | Thread-safe Core Data setup with in-memory option for tests |
| **Logging & Errors**     | `Logger` (OSLog) + custom `AppError` enum       | Unified error handling and diagnostics              |
| **Design System**        | Extensions for `Font`, `UIFont`, `Color`        | Consistent typography & theming across the app      |
| **Testing Foundation**   | Ready-to-use `XCTestCase` subclasses + helpers  | Faster, cleaner unit and UI tests                   |
| **MVVM Ready**           | Example ViewModel base classes                  | Immediate clean architecture starting point         |

## Quick Start

```swift
import IbTools

// 1. Networking
let client = APIClient.live
let podcasts = try await client.request(.podcasts)

// 2. Core Data (real or in-memory for tests)
let stack = CoreDataStack(.persistent)   // or .inMemory
try stack.saveContext()

// 3. Logging
Logger.networking.info("Fetched \(podcasts.count) podcasts")


Detailed Modules
1. Networking (Sources/Networking)

APIClient protocol + URLSessionClient live implementation
NetworkManager with built-in retry, timeout, and JSON decoding
Fully mockable (APIClientMock) for 100% test coverage
All requests use modern async/await

2. Persistence (Sources/Persistence)

CoreDataStack singleton with two modes:
.persistent → normal on-device database
.inMemory → automatically used in test targets

Pre-configured merge policies and automatic store migration

3. Logging (Sources/Logging)

Wrapper around os.log with subsystems and categories
Simple static API: Logger.networking.error(...)

4. Design System (Sources/DesignSystem)

Font+Custom.swift – semantic font scales (title, body, caption…)
Color+App.swift – app colour palette with dark mode support
Easy to extend or replace with your own brand

5. Testing Helpers (Sources/Testing)

XCTestCase+Helpers.swift – common assertions and async testing utilities
Pre-made MockAPIClient and in-memory Core Data stack automatically injected in test targets

Installation
Just add it as a Swift Package dependency in Xcode:
https://github.com/ibcode1/

Usage
Add the package to your app target (or framework)
Import IbTools wherever needed
