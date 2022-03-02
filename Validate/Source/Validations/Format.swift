import Foundation


public extension Validation {
    /// Validate a string matches a regular expression.
    /// - Parameters:
    ///   - pattern: The regular expression pattern.
    ///   - options: The regular expression options that are applied to the
    ///   expression during matching. See NSRegularExpression.Options for possible values.
    ///   - message: Custom error message.
    /// - Returns: A Validation<String> instance.
    static func format(
        _ pattern: String,
        options: NSRegularExpression.Options = [],
        message: String? = nil
    ) -> Validation<String> {
        .init { value in
            let regex = NSRegularExpression(pattern, options: options)
            guard !regex.matches(value) else { return }
            
            throw ValidationError.build(message: message)
        }
    }
    
    /// Validate an optional string matches a regular expression.
    /// - Parameters:
    ///   - pattern: The regular expression pattern.
    ///   - options: The regular expression options that are applied to the
    ///   expression during matching. See NSRegularExpression.Options for possible values.
    ///   - message: Custom error message.
    /// - Returns: A Validation<String> instance.
    static func format(
        _ pattern: String,
        options: NSRegularExpression.Options = [],
        message: String? = nil
    ) -> Validation<Optional<String>> {
        .init { value in
            guard let value = value else {
                throw ValidationError.build(message: message)
            }
            
            let regex = NSRegularExpression(pattern, options: options)
            guard !regex.matches(value) else { return }
            
            throw ValidationError.build(message: message)
        }
    }
}



// MARK: Error

extension ValidationError {
    private static func format() -> ValidationError {
        .init(description: "Is incorrectly formatted")
    }
    
    // MARK: Builder
    
    fileprivate static func build(message: String?) -> ValidationError {
        guard let message = message else {
            return ValidationError.format()
        }
        
        return ValidationError(description: message)
    }
}
