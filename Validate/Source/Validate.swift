import Foundation
import SwiftUI


/// A property wrapper that can validate the property it wraps.
///
/// When the wrapped value changes `@Validate` will run the provided
/// validations against the value.
///
/// Once validated, the `isValid` and `errors` properties can provide
/// validation results.
///
/// The `Validate` framwork contains a number of built in validations such
/// as presence, count and format. All which a various array of types.
///
/// If the included validations don't quite do what is required, new validations
/// can be built with the `Validation` struct.
@propertyWrapper
public struct Validate<Value>: DynamicProperty {
    /// The wrapped value
    public var wrappedValue: Value {
        get { self.validator.value }
        nonmutating set {
            self.validator.value = newValue
        }
    }
    
    public var projectedValue: Validate<Value> {
        self
    }
    
    /// Create a binding for the wrapped value.
    ///
    /// This is useful for working with SwiftUI components.
    public var binding: Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { self.wrappedValue = $0 }
        )
    }
    
    /// The errors produced when validating the wrapped value.
    public var errors: [Error] {
        self.validator.errors
    }
    
    /// Indicates whether the wrapped value is valid.
    public var isValid: Bool { self.errors.isEmpty }
    
    // Private
    @ObservedObject private var validator: Validator<Value>
    
    // MARK: Initialization
    
    /// Initialize a `Validate` instance.
    /// - Parameters:
    ///   - wrappedValue: The value to wrap.
    ///   - validations: The validations.
    public init(
        wrappedValue: Value,
        _ validations: Validation<Value>...
    ) {
        self.init(wrappedValue: wrappedValue, validations: validations)
    }
    
    /// Initialize a `Validate` instance where Value is optional.
    /// - Parameters:
    ///   - wrappedValue: The value to wrap.
    ///   - validations: The validations.
    public init<T>(
        wrappedValue: Value,
        _ validations: Validation<Value>...
    ) where Value == Optional<T> {
        self.init(wrappedValue: wrappedValue, validations: validations)
    }
    
    init(
        wrappedValue: Value,
        validations: [Validation<Value>]
    ) {
        self._validator = ObservedObject(
            wrappedValue: Validator(
                value: wrappedValue,
                validations: validations
            )
        )
    }
}

// MARK: Equatable

extension Validate: Equatable where Value: Equatable {
    public static func ==(lhs: Validate, rhs: Validate) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}
