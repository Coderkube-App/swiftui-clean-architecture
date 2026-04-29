//
// Copyright (c) 2026 Coderkube Technologies - ios-swiftui-clean-architecture-template. All rights reserved.
//

import Foundation

/// Core business entity representing a User.
public struct User: Identifiable, Equatable {
  public let id: Int
  public let name: String
  public let email: String
  public let avatarUrl: URL?
  
  public init(id: Int, name: String, email: String, avatarUrl: URL?) {
    self.id = id
    self.name = name
    self.email = email
    self.avatarUrl = avatarUrl
  }
}
