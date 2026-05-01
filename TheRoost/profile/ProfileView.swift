import SwiftUI

struct ProfileView: View {
    @State private var darkModeOn = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    // Top title row
                    HStack {
                        Text("My Profile")
                            .font(.system(size: 24, weight: .bold))

                        Spacer()

                        Image(systemName: "square.and.arrow.down")
                            .font(.system(size: 28, weight: .bold))
                    }
                    .padding(.top, 10)

                    Divider()
                        .overlay(Color.black)

                    // Profile image area
                    VStack(spacing: 10) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .foregroundColor(.black)

                        Text("Click to add Photo")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)

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

                    // Settings section
                    VStack(spacing: 18) {
                        HStack {
                            Image(systemName: "circle.lefthalf.filled")
                                .font(.system(size: 28))
                                .frame(width: 40)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Mode")
                                    .font(.system(size: 18, weight: .medium))

                                Text("Dark & Light")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Toggle("", isOn: $darkModeOn)
                                .labelsHidden()
                                .tint(.black)
                                .scaleEffect(1.1)
                        }

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

                    Divider()
                        .overlay(Color.black)
                        .padding(.top, 8)
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 20)
            }

        }
        .foregroundColor(.black)
        .background(Color(red: 244/255, green: 182/255, blue: 63/255))
    }

    func profileRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 28))
                .frame(width: 40)

            Text(title)
                .font(.system(size: 18, weight: .medium))

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 22, weight: .bold))
        }
    }
}

#Preview {
    ProfileView()
}

