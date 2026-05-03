import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    @State var user = sampleUser()
    @State var courses = Courses()
    
    @State var userName: String = ""
    @State var passwd: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("The Roost")
                .foregroundStyle(.headerTxt)
                .font(.largeTitle)
                .bold()
            
            Image("roostIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text("Log Into Your Account")
                .font(.subheadline)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Username")
                    .bold()
                
                TextField("Username", text: $userName)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                    )
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .bold()
                
                SecureField("Password", text: $passwd)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                    )
            }
            
            if showError {
                Text("Incorrect username or password")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            
            Button {
                if userName == user.userName && passwd == user.pass {
                    isLoggedIn = true
                    showError = false
                } else {
                    showError = true
                }
            } label: {
                Text("Log In")
                    .font(.headline.bold())
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .foregroundStyle(.contrast)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.headerTxt)
                    )
                    .bold()
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 80)
        .foregroundStyle(.normalTxt)
        .fontDesign(.rounded)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backing)
    }
}

#Preview {
    LoginView()
}
