import Foundation


/// Describes a validation error.
public struct ValidationError: LocalizedError
{
    /// A localized message describing what error occurred.
    public var errorDescription: String? { self.description }
    
    // Private
    private let description: String
    
    // MARK: Initalization
    
    /// Initialize a new `ValidationError` instance.
    /// - Parameter description: The description of the error.
    public init(description: String)
    {
        self.description = description
    }
}
