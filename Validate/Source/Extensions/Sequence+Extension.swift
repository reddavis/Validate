import Foundation


public extension Sequence where Element: Error
{
    var localizedDescriptions: [String] {
        self.map { $0.localizedDescription }
    }
}
