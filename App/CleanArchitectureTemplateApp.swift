//
// Copyright (c) 2026 Coderkube Technologies - CleanArchitectureTemplateApp. All rights reserved.
//

import SwiftUI

@main
struct CleanArchitectureTemplateApp: App {
  private let diContainer = DIContainer()
  @StateObject private var coordinator: AppCoordinator
  
  init() {
    _coordinator = StateObject(wrappedValue: AppCoordinator(diContainer: DIContainer()))
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationStack(path: $coordinator.navigationPath) {
        coordinator.start()
      }
    }
  }
}
