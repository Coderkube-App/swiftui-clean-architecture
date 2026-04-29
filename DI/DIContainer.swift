//
// Copyright (c) 2026 Coderkube Technologies - ios-swiftui-clean-architecture-template. All rights reserved.
//

import SwiftUI

/// Centralized Dependency Injection Container.
/// Manages the creation of dependencies for each layer.
@MainActor
public class DIContainer {
  
  // Configurable API URL
  private let apiBaseURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
  
  public init() {}
  
  // MARK: - Core / Network
  private func makeNetworkService() -> NetworkServiceProtocol {
    return DefaultNetworkService()
  }
  
  // MARK: - Data Layer
  private func makeRemoteUserDataSource() -> RemoteUserDataSourceProtocol {
    return RemoteUserDataSource(
      networkService: makeNetworkService(),
      endpoint: apiBaseURL
    )
  }
  
  private func makeUserRepository() -> UserRepositoryProtocol {
    return UserRepositoryImpl(remoteDataSource: makeRemoteUserDataSource())
  }
  
  // MARK: - Domain Layer
  private func makeFetchUsersUseCase() -> FetchUsersUseCaseProtocol {
    return FetchUsersUseCase(repository: makeUserRepository())
  }
  
  // MARK: - Presentation Layer
  public func makeUserListViewModel() -> UserListViewModel {
    return UserListViewModel(fetchUsersUseCase: makeFetchUsersUseCase())
  }
  
  public func makeUserListView(onUserSelected: ((User) -> Void)?) -> some View {
    // Delaying initialization to be done via closure to avoid holding state statically
    return UserListView(viewModel: self.makeUserListViewModel(), onUserSelected: onUserSelected)
  }
}
