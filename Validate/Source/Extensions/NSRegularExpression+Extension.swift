import Foundation


extension NSRegularExpression {
    // MARK: Initialization
    
    convenience init(_ pattern: String, options: NSRegularExpression.Options) {
        do {
            try self.init(pattern: pattern, options: options)
        } catch {
            preconditionFailure("Invalid regex pattern: \(pattern)")
        }
    }
    
    // MARK: Matches
    
    func matches(_ value: String) -> Bool {
        let range = NSRange(location: 0, length: value.utf16.count)
        return self.firstMatch(in: value, options: [], range: range) != nil
    }
}
