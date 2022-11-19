import XCTest
@testable import SafeSubscripts

final class SafeSubscriptsTests: XCTestCase {
    func test() throws {
        let array = [1, 2, 3]
        
        XCTAssertEqual(array[safe: 2], 3)
        XCTAssertNil(array[safe: 3])
    }
}
