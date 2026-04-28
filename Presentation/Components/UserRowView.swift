//
// Copyright (c) 2026 Coderkube Technologies - SwiftUICleanArchitectureApp. All rights reserved.
//

import SwiftUI

public struct UserRowView: View {
  public let user: User
  
  public init(user: User) {
    self.user = user
  }
  
  public var body: some View {
    HStack(spacing: 16) {
      AsyncImage(url: user.avatarUrl) { phase in
        switch phase {
        case .empty:
          ProgressView()
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
        case .failure:
          Image(systemName: "person.circle.fill")
            .resizable()
            .foregroundColor(.gray)
        @unknown default:
          EmptyView()
        }
      }
      .frame(width: 50, height: 50)
      .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: 4) {
        Text(user.name)
          .font(.headline)
        Text(user.email)
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
    }
    .padding(.vertical, 8)
  }
}
