//
// Copyright (c) 2026 Coderkube Technologies - SwiftUICleanArchitectureApp. All rights reserved.
//

import SwiftUI

/// Coordinator handles navigation logic separately from views.
@MainActor
public class AppCoordinator: ObservableObject {
  @Published public var navigationPath = NavigationPath()
  private let diContainer: DIContainer
  
  public init(diContainer: DIContainer) {
    self.diContainer = diContainer
  }
  
  public func start() -> some View {
    diContainer.makeUserListView(onUserSelected: { [weak self] user in
      self?.navigateToUserDetail(user: user)
    })
    .navigationDestination(for: Route.self) { route in
      self.resolveRoute(route)
    }
  }
  
  private func navigateToUserDetail(user: User) {
    navigationPath.append(Route.userDetail(user))
  }
  
  @ViewBuilder
  private func resolveRoute(_ route: Route) -> some View {
    switch route {
    case .userDetail(let user):
      // Mock detail view. In reality, you'd use DI container to build this.
      Text("Details for \(user.name)")
        .navigationTitle(user.name)
    }
  }
}

public enum Route: Hashable {
  case userDetail(User)
  
  public static func == (lhs: Route, rhs: Route) -> Bool {
    switch (lhs, rhs) {
    case (.userDetail(let lUser), .userDetail(let rUser)):
      return lUser.id == rUser.id
    }
  }
  
  public func hash(into hasher: inout Hasher) {
    switch self {
    case .userDetail(let user):
      hasher.combine(user.id)
    }
  }
}
