import XCTest
@testable import tippy

class tippyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(tippy().text, "Hello, World!")
    }


    static var allTests : [(String, (tippyTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
