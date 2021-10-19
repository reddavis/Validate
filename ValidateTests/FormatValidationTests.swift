import XCTest
@testable import Validate


class FormatValidationTests: XCTestCase
{
    func testFormatValidation()
    {
        @Validate(.format("\\d{3}")) var value: String = ""
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssert(_value.isValid)
    }

    func testFormatValidationForOptionalString()
    {
        @Validate(.format("\\d{3}")) var value: String? = nil
        XCTAssertFalse(_value.isValid)

        value = "abc"
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssert(_value.isValid)
    }
    
    // MARK: Errors
    
    func testFormatErrorMessage() throws
    {
        @Validate(.format("\\d{3}")) var value: String = ""
        XCTAssertEqual(_value.errors.count, 1)
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Is incorrectly formatted")
    }
    
    func testCustomErrorMessage() throws
    {
        let message = "this is a message"
        @Validate(
            .format(
                "\\d{3}",
                message: message
            )
        )
        var value: String = ""
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    func testCustomErrorMessageForOptionalString() throws
    {
        let message = "this is a message"
        @Validate(
            .format(
                "\\d{3}",
                message: message
            )
        )
        var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
}
