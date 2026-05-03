import SwiftUI

struct CardContent: View {
    let course: Course
    let isMember: Bool
    
    @Binding var user: sampleUser

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    private var textColor: Color {
        course.color.isDark ? .white : .black
    }
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            HStack (spacing: 24) {
                Image(systemName: course.image)
                    .font(Font.system(size: 60))
                
                VStack (alignment: .leading, spacing: 4) {
                    Text(course.code)
                        .font(.largeTitle.bold())
                    Text(course.name)
                        .font(Font.system(size: 20, weight: .semibold))
                        .lineLimit(2)
                        .truncationMode(.tail)
                        
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 35)
            .frame(maxWidth: .infinity)
            .background(course.color)
            .foregroundStyle(textColor)
            
            ScrollView {
                Text(course.description)
            }
            .padding(.horizontal)
            .foregroundStyle(.normalTxt)
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    Text("Member Count: \(course.members)")
                }
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .font(.caption)
                .foregroundStyle(.normalTxt)
                
                HStack (spacing: 10) {
                    Button (
                        action: {
                            if isMember {
                                user.courses.removeAll { val in
                                    val.code == course.code }
                            } else {
                                user.courses.append(course)
                            }
                            
                            dismiss()
                        }
                    ) {
                        if (isLoggedIn) {
                            HStack {
                                Text(isMember ? "Leave Group" : "Join Group")
                                Image(systemName: isMember ? "minus.circle" : "plus.circle")
                            }
                            .font(.headline.bold())
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.contrast)
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.headerTxt)
                            )
                        } else {
                            Text("Log in to Join Groups")
                                .font(.headline.bold())
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.contrast)
                                .padding(14)
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color.headerTxt)
                                )
                                .opacity(0.5)
                        }
                        
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.backing)
    }
}
