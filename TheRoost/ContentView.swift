import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("darkMode") var darkMode: Bool = false
    
    @State var user = sampleUser()
    @State var courses = Courses()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Dashboard(courses: $courses, user: $user)
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
            
            if (isLoggedIn) {
                Messages(user: $user)
                    .tabItem {
                        Image(systemName: "ellipsis.message.fill")
                    }
                    .tag(1)
            }
            
            UserManager()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
                .tag(2)
        }
        .tint(Color.secondary)
        .preferredColorScheme(
            isLoggedIn ? (darkMode ? .dark : .light) : .light
        )
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
