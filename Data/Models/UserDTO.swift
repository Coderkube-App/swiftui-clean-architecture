//
// Copyright (c) 2026 Coderkube Technologies - SwiftUICleanArchitectureApp. All rights reserved.
//

import Foundation

/// Data Transfer Object representing the JSON structure returned by the API.
public struct UserDTO: Decodable {
  public let id: Int
  public let name: String
  public let email: String
  public let avatar: String?
  
  /// Maps the DTO to the Domain Entity
  public func toDomain() -> User {
    return User(
      id: id,
      name: name,
      email: email,
      avatarUrl: avatar.flatMap { URL(string: $0) }
    )
  }
}
