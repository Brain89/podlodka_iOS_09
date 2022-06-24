import UIKit
import XCTest

/// A simple struct containing a list of users.
struct UsersViewModel {
    let users: [String]

    var hasUsers: Bool {
        return !users.isEmpty
    }
}

/// A test case to validate our logic inside the `UsersViewModel`.
final class UsersViewModelTests: XCTestCase {

    /// It should correctly reflect whether it has users.
    func testThatViewModelStoresUsersAfterInitialization() {
        // arrange
        let users = ["Егор", "Женя", "Стас", "Катя"]
        
        // act
        let viewModel = UsersViewModel(users: users)
        
        // assert
        XCTAssertTrue(viewModel.hasUsers)
    }
    
    func testFirstNameNotEmpty() throws {
        let viewModel = UsersViewModel(users: ["Antoine", "Maaike", "Jaap"])

        let firstName =  try XCTUnwrap(viewModel.users.first)
        XCTAssertFalse(firstName.isEmpty)
    }

}
