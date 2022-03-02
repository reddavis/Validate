import Foundation


extension Sequence where Element: Error {
     public var localizedDescriptions: [String] {
        self.map { $0.localizedDescription }
    }
}
