//
// Copyright (c) 2026 Coderkube Technologies - SwiftUICleanArchitectureApp. All rights reserved.
//

import Foundation

/// Protocol defining the contract for user-related data operations.
/// This abstraction ensures the Domain layer doesn't depend on Data layer implementations.
public protocol UserRepositoryProtocol {
  func fetchUsers() async throws -> [User]
}
