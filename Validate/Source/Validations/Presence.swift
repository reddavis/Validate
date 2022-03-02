import Foundation


public extension Validation {
    /// Validate an optional value is present.
    ///
    /// If the value is nil, it is considered invalid.
    /// - Parameters:
    ///   - message: A custom error message.
    /// - Returns: A Validation instance.
    static func presence<T>(
        message: String? = nil
    ) -> Validation<Optional<T>> {
        .init { value in
            if value == nil {
                throw ValidationError.build(message: message)
            }
        }
    }
    
    /// Validate an optional string is present.
    ///
    /// If the value is nil, it is considered invalid.
    ///
    /// When `allowEmpty` is `true` the string `""` is valid.
    /// When `allowEmpty` is `false` the string `""` is not valid.
    /// - Parameters:
    ///   - allowEmpty: Indicate whether an empty string validates as present.
    ///   - message: A custom error message.
    /// - Returns: A Validation instance.
    static func presence(
        allowEmpty: Bool = false,
        message: String? = nil
    ) -> Validation<Optional<String>> {
        .init { value in
            guard let value = value else {
                throw ValidationError.build(message: message)
            }
            
            if value.isEmpty && !allowEmpty {
                throw ValidationError.build(message: message)
            }
        }
    }
    
    /// Validate a string is not empty.
    ///
    /// As the string is not optional, this presence validation checks the
    /// string is not empty.
    /// - Parameters:
    ///   - message: A custom error message.
    /// - Returns: A Validation instance.
    static func presence(
        message: String? = nil
    ) -> Validation<String> {
        .init { value in
            if value.isEmpty {
                throw ValidationError.build(message: message)
            }
        }
    }
}



// MARK: Error

extension ValidationError {
    private static func presence() -> ValidationError {
        .init(description: "Can't be blank")
    }
    
    // MARK: Builder
    
    fileprivate static func build(message: String?) -> ValidationError {
        guard let message = message else {
            return ValidationError.presence()
        }
        
        return ValidationError(description: message)
    }
}
