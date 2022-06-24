import XCTest
@testable import Issue

class TestAssertionForwardTests: XCTestCase {

    func testExample() throws {
        assert(actual: 10, expected: 20) // asserts in method
        assert(actual: 10, expected: 11) // asserts in method
        assertInLine(actual: 10, expected: 11) // asserts in line
        assertInLine(actual: 10, expected: 11) // asserts in line
    }
}

extension TestAssertionForwardTests {

    func assert(
        actual: Int,
        expected: Int
    ) {
        XCTAssertEqual(actual, expected)
    }

    func assertInLine(
        actual: Int,
        expected: Int,
        filePath: String = #file,
        lineNumber: Int = #line
    ) {
        if actual != expected {
            let location = XCTSourceCodeLocation(
                filePath: filePath,
                lineNumber: lineNumber
            )
            let context = XCTSourceCodeContext(location: location)
            let issue = XCTIssue(type: .assertionFailure,
                                 compactDescription: "\(actual) is not equal to \(expected)",
                                 detailedDescription: nil,
                                 sourceCodeContext: context,
                                 associatedError: nil,
                                 attachments: [])
            record(issue)
        }
    }
}
