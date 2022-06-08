import XCTest
@testable import EASwiftLibraryTemplate

final class EASwiftLibraryTemplateTests: XCTestCase {
    func testAuthorMessage() throws {
        XCTAssertEqual(EASwiftLibraryTemplate().authorMessage, "Made with ❤️ by Kimi")
    }
}
