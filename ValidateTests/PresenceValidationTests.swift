import XCTest
@testable import Validate


class PresenceValidationTests: XCTestCase
{
    func testPresenceValidation() throws
    {
        @Validate(.presence()) var value: Int? = nil
        XCTAssertFalse(_value.isValid)
        
        value = 1
        XCTAssert(_value.isValid)
    }
    
    func testPresenceValidationForOptionalString()
    {
        @Validate(.presence(allowEmpty: true)) var blankAllowed: String? = nil
        XCTAssertFalse(_blankAllowed.isValid)
        blankAllowed = ""
        XCTAssert(_blankAllowed.isValid)

        @Validate(.presence(allowEmpty: false)) var blankNotAllowed: String? = nil
        XCTAssertFalse(_blankNotAllowed.isValid)
        blankNotAllowed = ""
        XCTAssertFalse(_blankNotAllowed.isValid)
        blankNotAllowed = "a"
        XCTAssert(_blankNotAllowed.isValid)
    }

    func testPresenceValidationForString()
    {
        @Validate(.presence()) var value: String = ""
        XCTAssertFalse(_value.isValid)
        value = "a"
        XCTAssert(_value.isValid)
    }
    
    // MARK: Errors
    
    func testPresenceErrorMessage() throws
    {
        @Validate(.presence()) var value: Int? = nil
        XCTAssertEqual(_value.errors.count, 1)
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Can't be blank")
    }
    
    func testCustomErrorMessage() throws
    {
        let message = "this is a message"
        @Validate(
            .presence(
                message: message
            )
        )
        var value: Int? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    func testCustomErrorMessageForString() throws
    {
        let message = "this is a message"
        @Validate(
            .presence(
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
            .presence(
                message: message
            )
        )
        var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
}
