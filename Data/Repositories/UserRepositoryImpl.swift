//
// Copyright (c) 2026 Coderkube Technologies - SwiftUICleanArchitectureApp. All rights reserved.
//

import Foundation

/// Concrete implementation of the UserRepositoryProtocol.
/// Translates Data models (DTOs) into Domain models (Entities).
public struct UserRepositoryImpl: UserRepositoryProtocol {
  private let remoteDataSource: RemoteUserDataSourceProtocol
  
  public init(remoteDataSource: RemoteUserDataSourceProtocol) {
    self.remoteDataSource = remoteDataSource
  }
  
  public func fetchUsers() async throws -> [User] {
    let userDTOs = try await remoteDataSource.fetchUsers()
    return userDTOs.map { $0.toDomain() }
  }
}
