import SwiftUI

struct Messages : View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            NavigationBar()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backing)
    }
}

#Preview {
    Messages()
}
