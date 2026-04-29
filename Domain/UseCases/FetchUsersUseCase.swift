//
// Copyright (c) 2026 Coderkube Technologies - ios-swiftui-clean-architecture-template. All rights reserved.
//

import Foundation

public protocol FetchUsersUseCaseProtocol {
  func execute() async throws -> [User]
}

/// Use case responsible for orchestrating the retrieval of users.
public struct FetchUsersUseCase: FetchUsersUseCaseProtocol {
  private let repository: UserRepositoryProtocol
  
  public init(repository: UserRepositoryProtocol) {
    self.repository = repository
  }
  
  public func execute() async throws -> [User] {
    // Business logic could be added here (e.g., filtering, sorting, validation)
    return try await repository.fetchUsers()
  }
}
