import XCTest
@testable import Unwrap

class UnwrapTests: XCTestCase {

    // MARK: - 1
    
    func testAddress1() throws {
        let userModel: User? = User(name: "Александр", address: nil)
        
        guard let user = userModel else {
            XCTFail("Expected non-nil user")
            return
        }
        
        guard let address = user.address else {
            XCTFail("Expected non-nil address")
            return
        }
        
        XCTAssertEqual(address.city, "Москва")
        XCTAssertEqual(address.country, "Россия")
    }
    
    // MARK: - 2
    
    func testAddress2() throws {
        let userModel: User? = User(name: "Александр", address: nil)
        
        guard
            let user = userModel,
            let address = user.address
        else {
            XCTFail("Expected non-nil user and address")
            return
        }
        
        XCTAssertEqual(address.city, "Москва")
        XCTAssertEqual(address.country, "Россия")
    }

    // MARK: - 3
    
    func testAddress3() throws {
        let user: User? = User(name: "Александр", address: nil)
        
        XCTAssertEqual(user?.address?.city, "Москва")
        XCTAssertEqual(user?.address?.country, "Россия")
    }

    // MARK: - 4
    
    func testAddress4() throws {
        let userModel: User? = User(name: "Александр", address: nil)
        let user = try XCTUnwrap(userModel)
        let address = try XCTUnwrap(user.address)
        
        XCTAssertEqual(address.city, "Москва")
        XCTAssertEqual(address.country, "Россия")
        
    }
}
