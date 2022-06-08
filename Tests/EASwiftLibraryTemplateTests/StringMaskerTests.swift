import XCTest
@testable import EASwiftLibraryTemplate

final class StringMaskerTests: XCTestCase {

    func testEmptyString() throws {
        let string = ""
        let result = StringMasker.mask(string: string, with: "*")
        XCTAssertTrue(result == string)
    }
    
    func testStringOfLength1() throws {
        let string = "1"
        let result = StringMasker.mask(string: string, with: "*")
        XCTAssertTrue(result == "*")
    }

    func testPINString() throws {
        let string = "1234"
        let result = StringMasker.mask(string: string, with: "*")
        XCTAssertTrue(result == "1**4")
    }
    
    func testCreditCardString() throws {
        let string = "4003 1002 4002 2002"
        let result = StringMasker.mask(string: string, with: "*")
        XCTAssertTrue(result == "4003***********2002")
    }
    
    func testUsingAnchorAsMask() throws {
        let string = "1234"
        let result = StringMasker.mask(string: string, with: "#")
        XCTAssertTrue(result == "1##4")
    }
}
