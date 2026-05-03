import SwiftUI

struct ProfileView: View {
    @Binding var darkMode: Bool

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // Top title row
                    HStack {
                        Image(systemName: "gear")
                        Text("My Profile")
                            .bold()
                    }
                    .foregroundStyle(.headerTxt)
                    .font(.largeTitle)

                    // Profile image area
                    VStack(spacing: 10) {
                        Image(systemName: "person.crop.circle")
                            .font(Font.system(size: 150))

                        Text("Click to add Photo")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    
                    Divider()

                    // First section
                    VStack(spacing: 18) {
                        profileRow(
                            icon: "person.text.rectangle",
                            title: "Edit Profile Info"
                        )

                        profileRow(
                            icon: "person.3.fill",
                            title: "My Groups"
                        )
                    }

                    Text("GENERAL SETTINGS")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.top, 10)

                    Divider()
                    
                    // Settings section
                    VStack(spacing: 18) {
                        HStack {
                            Image(systemName: "circle.lefthalf.filled")
                                .font(.system(size: 28))
                                .frame(width: 40)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Mode")
                                    .font(.system(size: 16, weight: .medium))

                                Text("Dark & Light")
                                    .font(.system(.caption))
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Toggle("", isOn: $darkMode)
                                .labelsHidden()
                                .tint(.headerTxt)
                                .scaleEffect(0.7)
                        }
                        
                        Divider()

                        profileRow(
                            icon: "globe",
                            title: "Language"
                        )

                        profileRow(
                            icon: "exclamationmark.circle.fill",
                            title: "Terms & Conditions"
                        )

                        profileRow(
                            icon: "lock.fill",
                            title: "Privacy Policy"
                        )

                        profileRow(
                            icon: "heart.text.square.fill",
                            title: "Rate the App"
                        )

                        profileRow(
                            icon: "arrowshape.turn.up.right.circle.fill",
                            title: "Share the App"
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }

        }
        .fontDesign(.rounded)
        .foregroundColor(.normalTxt)
        .background(.backing)
    }

    func profileRow(icon: String, title: String) -> some View {
        VStack {
            HStack (spacing: 20) {
                Image(systemName: icon)
                Text(title)

                Spacer()

                Image(systemName: "chevron.right")
            }
            .font(.system(size: 16, weight: .medium))
            
            Divider()
        }
    }
}

