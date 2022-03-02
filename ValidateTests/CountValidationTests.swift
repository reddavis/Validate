import XCTest
@testable import Validate


class CountValidationTests: XCTestCase {
    // MARK: Greater than
    
    func testCountGreaterThanValidation() {
        @Validate(.count(greaterThan: 3)) var value: String = ""
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssertFalse(_value.isValid)

        value = "1234"
        XCTAssert(_value.isValid)
    }
 
    func testCountGreaterThanForOptionalValidation() {
        @Validate(.count(greaterThan: 3)) var value: String? = nil
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssertFalse(_value.isValid)

        value = "1234"
        XCTAssert(_value.isValid)
    }
    
    func testGreaterThanErrorMessage() throws {
        @Validate(.count(greaterThan: 3)) var value: String = ""
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be greater than 3")
    }
    
    func testGreaterThanErrorMessageForOptional() throws {
        @Validate(.count(greaterThan: 3)) var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be greater than 3")
    }
    
    func testGreaterThanCustomErrorMessage() throws {
        let message = "a message"
        @Validate(
            .count(
                greaterThan: 3,
                message: { _ in message }
            )
        )
        var value: String = ""
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    func testGreaterThanCustomErrorMessageForOptional() throws {
        let message = "a message"
        @Validate(
            .count(
                greaterThan: 3,
                message: { _ in message }
            )
        )
        var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }

    // MARK: Less than
    
    func testCountLessThanValidation() {
        @Validate(.count(lessThan: 3)) var value: String = "12345"
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssertFalse(_value.isValid)

        value = "12"
        XCTAssert(_value.isValid)
    }

    func testCountLessThanForOptionalValidation() {
        @Validate(.count(lessThan: 3)) var value: String? = nil
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssertFalse(_value.isValid)

        value = "12"
        XCTAssert(_value.isValid)
    }
    
    func testLessThanErrorMessage() throws {
        @Validate(.count(lessThan: 3)) var value: String = "1234"
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be less than 3")
    }
    
    func testLessThanErrorMessageForOptional() throws {
        @Validate(.count(lessThan: 3)) var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be less than 3")
    }
    
    func testLessThanCustomErrorMessage() throws {
        let message = "a message"
        @Validate(
            .count(
                lessThan: 3,
                message: { _ in message }
            )
        )
        var value: String = "1234"
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    func testLessThanCustomErrorMessageForOptional() throws {
        let message = "a message"
        @Validate(
            .count(
                lessThan: 3,
                message: { _ in message }
            )
        )
        var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    // MARK: Equal

    func testCountEqualToValidation() {
        @Validate(.count(equalTo: 3)) var value: String = ""
        XCTAssertFalse(_value.isValid)

        value = "1234"
        XCTAssertFalse(_value.isValid)

        value = "12"
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssert(_value.isValid)
    }

    func testCountEqualToForOptionalValidation() {
        @Validate(.count(equalTo: 3)) var value: String? = nil
        XCTAssertFalse(_value.isValid)

        value = "1234"
        XCTAssertFalse(_value.isValid)

        value = "12"
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssert(_value.isValid)
    }
    
    func testEqualToErrorMessage() throws {
        @Validate(.count(equalTo: 3)) var value: String = ""
        XCTAssertFalse(_value.isValid)
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be equal to 3")
    }
    
    func testEqualToErrorMessageForOptional() throws {
        @Validate(.count(equalTo: 3)) var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be equal to 3")
    }
    
    func testEqualToCustomErrorMessage() throws {
        let message = "a message"
        @Validate(
            .count(
                equalTo: 3,
                message: { _ in message }
            )
        )
        var value: String = "1234"
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    func testEqualToCustomErrorMessageForOptional() throws {
        let message = "a message"
        @Validate(
            .count(
                equalTo: 3,
                message: { _ in message }
            )
        )
        var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    // MARK: Range

    func testCountRangeValidation() {
        @Validate(.count(in: 2...4)) var value: String = ""
        XCTAssertFalse(_value.isValid)

        value = "12345"
        XCTAssertFalse(_value.isValid)

        value = "1"
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssert(_value.isValid)
    }

    func testCountRangeForOptionalValidation() {
        @Validate(.count(in: 2...4)) var value: String? = nil
        XCTAssertFalse(_value.isValid)

        value = "12345"
        XCTAssertFalse(_value.isValid)

        value = "1"
        XCTAssertFalse(_value.isValid)

        value = "123"
        XCTAssert(_value.isValid)
    }
    
    func testRangeErrorMessage() throws {
        @Validate(.count(in: 2...4)) var value: String = ""
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be between 2 and 4")
    }
    
    func testRangeErrorMessageForOptional() throws {
        @Validate(.count(in: 2...4)) var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, "Should be between 2 and 4")
    }
    
    func testRangeCustomErrorMessage() throws {
        let message = "a message"
        @Validate(
            .count(
                in: 2...4,
                message: { _ in message }
            )
        )
        var value: String = ""
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
    
    func testRangeCustomErrorMessageForOptional() throws {
        let message = "a message"
        @Validate(
            .count(
                in: 2...4,
                message: { _ in message }
            )
        )
        var value: String? = nil
        
        let error = try XCTUnwrap(_value.errors.first as? ValidationError)
        XCTAssertEqual(error.errorDescription, message)
    }
}
