# ios-swiftui-clean-architecture-template

## Overview
Production-ready SwiftUI application demonstrating scalable architecture and real-world implementation.

## Features
- Clean Architecture + MVVM
- Modular structure (feature-based where needed)
- Dependency Injection (manual container)
- Navigation system (Coordinator pattern)
- Environment configuration (Dev / Prod ready)

## Architecture
- Clean Architecture
- MVVM
- Repository Pattern
- Coordinator Pattern

## Tech Stack
- Swift
- SwiftUI
- Combine / Async-Await

## Project Structure
- **App/**: App Entry Point & Lifecycle
- **Core/**: Shared Utilities, Constants, and Extensions
- **DI/**: Dependency Injection Container
- **Data/**: Models (DTOs), Concrete Repositories, and Data Sources
- **Domain/**: Core Business Models, Repository Protocols, and UseCases
- **Presentation/**: Reusable UI Components, Screens, ViewModels, and Navigation Coordinators
- **Resources/**: Assets, fonts, and colors
- **Tests/**: Unit tests for Domain and Data layers

## Use Cases
- Scalable apps
- Startup MVPs
- Production-ready systems requiring high maintainability and testability

## Getting Started
1. Clone the repository.
2. Ensure XcodeGen is installed: `brew install xcodegen`
3. Run `xcodegen generate` in the project root directory.
4. Open the generated `ios-swiftui-clean-architecture-template.xcodeproj`.
5. Build and run the scheme.

## Demo
![Demo Screenshot](/placeholder-demo.png)

## Contact
hello@example.com
