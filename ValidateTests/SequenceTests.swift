import XCTest
@testable import Validate


class SequenceTests: XCTestCase {
    func testErrorMessages() {
        let descriptionA = "abc"
        let errorA = ValidationError(description: descriptionA)
        
        let descriptionB = "def"
        let errorB = ValidationError(description: descriptionB)
        
        let errors = [errorA, errorB]
        XCTAssertEqual(errors.localizedDescriptions, ["abc", "def"])
    }
}
