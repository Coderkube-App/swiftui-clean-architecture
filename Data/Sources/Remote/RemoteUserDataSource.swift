//
// Copyright (c) 2026 Coderkube Technologies - ios-swiftui-clean-architecture-template. All rights reserved.
//

import Foundation

public protocol RemoteUserDataSourceProtocol {
  func fetchUsers() async throws -> [UserDTO]
}

/// Fetches user data from a remote API.
public struct RemoteUserDataSource: RemoteUserDataSourceProtocol {
  private let networkService: NetworkServiceProtocol
  private let endpoint: URL
  
  public init(networkService: NetworkServiceProtocol, endpoint: URL) {
    self.networkService = networkService
    self.endpoint = endpoint
  }
  
  public func fetchUsers() async throws -> [UserDTO] {
    // Assume API returns an array of UserDTO directly or nested in a structure.
    // For demonstration, we'll assume a direct array response.
    return try await networkService.request(url: endpoint)
  }
}
