import Foundation


/// A struct for encapsulating validations.
public struct Validation<Value>
{
    public typealias Validate = (_ value: Value) throws -> Void
    public let validate: Validate
    
    // MARK: Initialization
    
    /// Initialize a new `Validation` instance.
    /// - Parameter validate: A `Validation.Validate` closure.
    public init(_ validate: @escaping Validate)
    {
        self.validate = validate
    }
}
