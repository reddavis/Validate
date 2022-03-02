import Foundation


// MARK: Greater than

public extension Validation {
    typealias CountGreaterThanErrorMessageBuilder = (_ minimum: Int) -> String
    
    /// Validate a collection's count is greater than a minimum amount.
    /// - Parameters:
    ///   - greaterThan: The minimum amount.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        greaterThan minimum: Int,
        message: CountGreaterThanErrorMessageBuilder? = nil
    ) -> Validation<T> {
        .init { value in
            guard value.count > minimum else {
                throw ValidationError.buildGreaterThan(
                    minimum: minimum,
                    message: message
                )
            }
        }
    }
    
    /// Validate an optional collection's count is greater than a minimum amount.
    ///
    /// If the value is nil, it is considered invalid.
    /// - Parameters:
    ///   - greaterThan: The minimum amount.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        greaterThan minimum: Int,
        message: CountGreaterThanErrorMessageBuilder? = nil
    ) -> Validation<Optional<T>> {
        .init { value in
            guard let value = value,
                  value.count > minimum else {
                throw ValidationError.buildGreaterThan(
                    minimum: minimum,
                    message: message
                )
            }
        }
    }
}


// MARK: Greater than error

extension ValidationError {
    private static func greaterThan(minimum: Int) -> ValidationError {
        .init(description: "Should be greater than \(minimum)")
    }
    
    // MARK: Builder
    
    fileprivate static func buildGreaterThan(
        minimum: Int,
        message: Validation.CountGreaterThanErrorMessageBuilder?
    ) -> ValidationError {
        guard let message = message else {
            return ValidationError.greaterThan(minimum: minimum)
        }
        
        return ValidationError(description: message(minimum))
    }
}



// MARK: Less than

public extension Validation {
    typealias CountLessThanErrorMessageBuilder = (_ maximum: Int) -> String
    
    /// Validate a collection's count is less than a maximum amount.
    /// - Parameters:
    ///   - lessThan: The maximum amount.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        lessThan maximum: Int,
        message: CountLessThanErrorMessageBuilder? = nil
    ) -> Validation<T> {
        .init { value in
            guard value.count < maximum else {
                throw ValidationError.buildLessThan(
                    maximum: maximum,
                    message: message
                )
            }
        }
    }
    
    /// Validate a collection's count is less than a maximum amount.
    ///
    /// If the value is nil, it is considered invalid.
    /// - Parameters:
    ///   - lessThan: The maximum amount.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        lessThan maximum: Int,
        message: CountLessThanErrorMessageBuilder? = nil
    ) -> Validation<Optional<T>> {
        .init { value in
            guard let value = value,
                  value.count < maximum else {
                throw ValidationError.buildLessThan(
                    maximum: maximum,
                    message: message
                )
            }
        }
    }
}


// MARK: Less than error

extension ValidationError {
    private static func lessThan(maximum: Int) -> ValidationError {
        .init(description: "Should be less than \(maximum)")
    }
    
    // MARK: Builder
    
    fileprivate static func buildLessThan(
        maximum: Int,
        message: Validation.CountLessThanErrorMessageBuilder?
    ) -> ValidationError {
        guard let message = message else {
            return ValidationError.lessThan(maximum: maximum)
        }
        
        return ValidationError(description: message(maximum))
    }
}



// MARK: Equal to

public extension Validation {
    typealias CountEqualToErrorMessageBuilder = (_ value: Int) -> String
    
    /// Validate a collection's count is equal to an amount.
    /// - Parameters:
    ///   - equalTo: The value to be equal to.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        equalTo count: Int,
        message: CountEqualToErrorMessageBuilder? = nil
    ) -> Validation<T> {
        .init { value in
            guard value.count == count else {
                throw ValidationError.buildEqualTo(
                    value: count,
                    message: message
                )
            }
        }
    }

    /// Validate an optional collection's count is equal to an amount.
    ///
    /// If the value is nil, it is considered invalid.
    /// - Parameters:
    ///   - equalTo: The value to be equal to.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        equalTo count: Int,
        message: CountEqualToErrorMessageBuilder? = nil
    ) -> Validation<Optional<T>> {
        .init { value in
            guard
                let value = value,
                value.count == count else {
                throw ValidationError.buildEqualTo(
                    value: count,
                    message: message
                )
            }
        }
    }
}


// MARK: Equal to error

extension ValidationError {
    private static func equalTo(value: Int) -> ValidationError {
        .init(description: "Should be equal to \(value)")
    }
    
    // MARK: Builder
    
    fileprivate static func buildEqualTo(
        value: Int,
        message: Validation.CountEqualToErrorMessageBuilder?
    ) -> ValidationError {
        guard let message = message else {
            return ValidationError.equalTo(value: value)
        }
        
        return ValidationError(description: message(value))
    }
}


// MARK: In

public extension Validation {
    typealias CountRangeErrorMessageBuilder = (_ range: ClosedRange<Int>) -> String
    
    /// Validate a collection's count is in a range.
    /// - Parameters:
    ///   - equalTo: The value to be equal to.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        in range: ClosedRange<Int>,
        message: CountRangeErrorMessageBuilder? = nil
    ) -> Validation<T> {
        .init { value in
            guard range.contains(value.count) else {
                throw ValidationError.buildRange(
                    range: range,
                    message: message
                )
            }
        }
    }
    
    /// Validate an optional collection's count is in a range.
    ///
    /// If the value is nil, it is considered invalid.
    /// - Parameters:
    ///   - equalTo: The value to be equal to.
    ///   - message: Closure to build custom error message.
    /// - Returns: A Validation instance.
    static func count<T: Collection>(
        in range: ClosedRange<Int>,
        message: CountRangeErrorMessageBuilder? = nil
    ) -> Validation<Optional<T>> {
        .init { value in
            guard let value = value,
                  range.contains(value.count) else {
                throw ValidationError.buildRange(
                    range: range,
                    message: message
                )
            }
        }
    }
}



// MARK: Error

extension ValidationError {
    private static func range(range: ClosedRange<Int>) -> ValidationError {
        .init(description: "Should be between \(range.lowerBound) and \(range.upperBound)")
    }
    
    // MARK: Builder
    
    fileprivate static func buildRange(
        range: ClosedRange<Int>,
        message: Validation.CountRangeErrorMessageBuilder?
    ) -> ValidationError {
        guard let message = message else {
            return ValidationError.range(range: range)
        }
        
        return ValidationError(description: message(range))
    }
}
