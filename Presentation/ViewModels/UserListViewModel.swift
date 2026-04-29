//
// Copyright (c) 2026 Coderkube Technologies - ios-swiftui-clean-architecture-template. All rights reserved.
//

import Foundation

@MainActor
public class UserListViewModel: ObservableObject {
  @Published public var state: ViewState<[User]> = .idle
  
  private let fetchUsersUseCase: FetchUsersUseCaseProtocol
  
  public init(fetchUsersUseCase: FetchUsersUseCaseProtocol) {
    self.fetchUsersUseCase = fetchUsersUseCase
  }
  
  public func loadUsers() async {
    state = .loading
    do {
      let users = try await fetchUsersUseCase.execute()
      state = .success(users)
    } catch {
      state = .error(error.localizedDescription)
    }
  }
}
