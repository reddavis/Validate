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



// MARK: Preview

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        ContentView()
    }
}
