import Foundation
import XCTest

protocol SimplePrint {
    func printAll()
}

struct SimpleManager: SimplePrint {
    func printAll() {
        print("All")
    }
}

class ComplexType: Identifiable {
    var id: String
    let name: String
    let action: SimplePrint
    
    init(id: String, name: String, action: SimplePrint) {
        self.id = id
        self.name = name
        self.action = action
    }
}

final class ExampleTests: XCTestCase {

	func test() {
        let complex1 = ComplexType(id: "1", name: "First", action: SimpleManager())
        let complex2 = ComplexType(id: "2", name: "Second", action: SimpleManager())
        
		XCTAssertIdentical(complex1, complex2)
	}
}

ExampleTests.defaultTestSuite.run()
