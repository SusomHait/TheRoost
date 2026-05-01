import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            // search dashboard
            Dashboard()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            
            // add a group
            GroupAdd()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
                .tag(1)
            
            
            // group DMs
            ChatView()
                .tabItem {
                    Image(systemName: "ellipsis.message.fill",)
                }
                .tag(2)
            
            // profile page
            Profile()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(3)
        }
        .tint(Color.accent)
    }
}

#Preview {
    ContentView()
}
