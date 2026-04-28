# SwiftUI Clean Architecture

Production-ready SwiftUI application demonstrating a scalable architecture and real-world implementation using modern iOS development practices.

---

## Overview

This project serves as a reference architecture for building maintainable and scalable iOS applications. It follows Clean Architecture principles with clear separation between layers and responsibilities.

---

## Features

* Clean Architecture + MVVM
* Modular and scalable structure
* Dependency Injection (manual container)
* Coordinator-based navigation
* Environment configuration (Dev / Prod ready)
* Structured data flow

---

## Architecture

* Clean Architecture
* MVVM
* Repository Pattern
* Coordinator Pattern

---

## Tech Stack

* Swift
* SwiftUI
* Combine / Async-Await

---

## Project Structure

```id="swift-structure-modern"
App/            # App entry point & lifecycle
Core/           # Shared utilities, constants, extensions
DI/             # Dependency injection container
Data/           # DTOs, repositories, data sources
Domain/         # Entities, use cases, repository protocols
Presentation/   # Views, ViewModels, coordinators
Resources/      # Assets, fonts, colors
Tests/          # Unit tests
```

---

## Layer Overview

* **Core**: Common utilities and shared logic
* **Data**: Handles external data sources and repository implementations
* **Domain**: Contains business logic and application rules
* **Presentation**: UI, state management, and navigation
* **DI**: Manages dependency injection

---

## Data Flow

```id="swift-flow-modern"
View → ViewModel → UseCase → Repository → DataSource → API
```

Response handling:

```id="swift-response-flow"
API → DTO → Repository → Entity → ViewModel → View
```

---

## Use Cases

* Scalable iOS applications
* Startup MVPs
* Production-grade apps requiring maintainability
* Teams adopting structured architecture

---

## Getting Started

1. Clone the repository

```bash id="swift-clone"
git clone https://github.com/your-username/your-repo.git
```

2. Install XcodeGen (if required)

```bash id="swift-xcodegen"
brew install xcodegen
```

3. Generate project files

```bash id="swift-generate"
xcodegen generate
```

4. Open the generated project and run

---

## Purpose

This template provides a strong foundation for:

* Clean and maintainable codebases
* Scalable architecture
* Consistent project structure
* Faster development setup

---


## Contributing

Contributions are welcome. You can fork the repository and submit a pull request.

---

## License

This project is licensed under the Apache License 2.0.
