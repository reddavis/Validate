import XCTest
@testable import Validate


class ValidationTests: XCTestCase
{
    func testSingleValidationErrors()
    {
        @Validate(.presence()) var value: Int? = nil
        XCTAssertEqual(_value.errors.count, 1)
        
        value = 1
        XCTAssertEqual(_value.errors.count, 0)
    }
    
    func testMultipleValidationErrors()
    {
        @Validate(.count(greaterThan: 2), .count(equalTo: 4))
        var value: String = ""
        
        XCTAssertEqual(_value.errors.count, 2)
        
        value = "123"
        XCTAssertEqual(_value.errors.count, 1)

        value = "1234"
        XCTAssertEqual(_value.errors.count, 0)
    }
}
