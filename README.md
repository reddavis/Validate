# Validate

A property wrapper that can validate the property it wraps.

When the wrapped value changes `@Validate` will run the provided validations against the value.

Once validated, the `isValid` and `errors` properties can provide validation results.

The `Validate` framwork contains a number of built in validations such as presence, count and format. All which a various array of types.

## Requirements

- iOS 15.0+
- macOS 12.0+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/reddavis/Validate", from: "2.0.0")
]
```

## Note

Worth noting Validate is still in very early days and API's are expected to change. Saying that, [SEMVER](https://semver.org) will be kept.

## Documentation

[API Reference]()

## Usage

```swift
import SwiftUI
import Validate


struct ContentView: View
{
    @Validate(.presence()) var name: String = ""
    
    var body: some View {
        VStack(spacing: 60) {
            VStack {
                TextField("Name", text: self.$name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                VStack {
                    ForEach(self._name.errors.localizedDescriptions, id: \.self) { message in
                        Text(message)
                            .foregroundColor(.red)
                            .font(.footnote)
                    }
                }
            }
            
            Button("Save") {
                print(self.name)
            }
            .buttonStyle(.bordered)
        }
    }
}
```

## Built in validations

Validate includes several validations:

- [Count](https://github.com/reddavis/Validate/blob/main/Validate/Source/Validations/Count.swift)
- [Presence](https://github.com/reddavis/Validate/blob/main/Validate/Source/Validations/Presence.swift)
- [Format](https://github.com/reddavis/Validate/blob/main/Validate/Source/Validations/Format.swift)

## Other Libraries

Check out some of my other libraries:

- [Papyrus](https://github.com/reddavis/Papyrus) - Papyrus aims to hit the sweet spot between saving raw API responses to the file system and a fully fledged database like Realm.
- [RedUx](https://github.com/reddavis/RedUx) - A super simple Swift implementation of the redux pattern making use of Swift 5.5's new async await API's.
- [Kyu](https://github.com/reddavis/Kyu) - A persistent queue system in Swift.
- [FloatingLabelTextFieldStyle](https://github.com/reddavis/FloatingLabelTextFieldStyle) - A floating label style for SwiftUI's TextField.
- [Panel](https://github.com/reddavis/Panel) - A panel component similar to the iOS Airpod battery panel.

## License

Whatevs.
