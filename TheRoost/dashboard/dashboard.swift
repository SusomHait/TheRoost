import SwiftUI

struct Dashboard : View {
    @State var searchValue = ""
    
    var body: some View {
        VStack {
            Text("Search Bar")
            Text("List of Courses")
            
            TextField("Search", text: $searchValue)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backing)
    }
}

#Preview {
    Dashboard()
}
