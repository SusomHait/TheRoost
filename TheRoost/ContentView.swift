import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    @State var darkMode: Bool = false
    
    var body: some View {
        TabView (selection: $selectedTab) {
            // search dashboard
            Dashboard()
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            
            
            // group DMs
            Messages()
                .tabItem {
                    Image(systemName: "ellipsis.message.fill")
                }
                .tag(1)
            
            // profile page
            ProfileView(darkMode: $darkMode)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(2)
        }
        .tint(Color.secondary)
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

// used for color correction for light/dark mode
extension Color {
    var isDark: Bool {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let brightness = (red * 299 + green * 587 + blue * 114) / 1000
        return brightness < 0.2
    }
}

#Preview {
    ContentView()
}
