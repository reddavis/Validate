import SwiftUI


final class Validator<Value>: ObservableObject {
    var value: Value {
        didSet {
            self.validate()
        }
    }
    
    var errors: [Error] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    // Private
    private let validations: [Validation<Value>]
    
    // MARK: Initialization
    
    init(value: Value, validations: [Validation<Value>]) {
        self.value = value
        self.validations = validations
        self.validate()
    }
    
    // Validate
    
    private func validate() {
        self.errors = self.validations.compactMap { validation in
            do {
                try validation.validate(self.value)
                return nil
            } catch {
                return error
            }
        }
    }
}
