//
// Copyright (c) 2026 Coderkube Technologies - ios-swiftui-clean-architecture-template. All rights reserved.
//

import SwiftUI

public struct UserListView: View {
  @StateObject private var viewModel: UserListViewModel
  
  // A closure to handle navigation to detail view if needed, demonstrating decoupled navigation
  public var onUserSelected: ((User) -> Void)?
  
  public init(viewModel: @autoclosure @escaping () -> UserListViewModel, onUserSelected: ((User) -> Void)? = nil) {
    _viewModel = StateObject(wrappedValue: viewModel())
    self.onUserSelected = onUserSelected
  }
  
  public var body: some View {
    Group {
      switch viewModel.state {
      case .idle:
        Color.clear.onAppear {
          Task { await viewModel.loadUsers() }
        }
      case .loading:
        ProgressView("Fetching Users...")
      case .success(let users):
        List(users) { user in
          UserRowView(user: user)
            .contentShape(Rectangle())
            .onTapGesture {
              onUserSelected?(user)
            }
        }
      case .error(let message):
        VStack {
          Text("Oops! Something went wrong.")
            .font(.headline)
          Text(message)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding()
          Button("Retry") {
            Task { await viewModel.loadUsers() }
          }
          .buttonStyle(.borderedProminent)
        }
      }
    }
    .navigationTitle("Users")
  }
}
