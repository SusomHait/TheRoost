import SwiftUI

struct UserManager: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    @State var user = sampleUser()
    @State var courses = Courses()
    
    var body: some View {
        if (isLoggedIn) {
            ProfileView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    UserManager()
}
