import SwiftUI

struct CourseCard: View {
    let course: Course
    let isMember: Bool
    let action: () -> Void
    
    private var textColor: Color {
        course.color.isDark ? .white : .black
    }

    var body: some View {
        Button(action: action) {
            VStack (alignment: .leading) {
                HStack (alignment: .top) {
                    Image(systemName: course.image)
                        .font(.largeTitle.bold())
                        .foregroundStyle(textColor)
                        .frame(width: 75, height: 75)
                        .background(
                            Circle()
                                .fill(Color.black.opacity(0.08))
                        )
                    
                    Spacer()
                    
                    if isMember {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(textColor)
                            .font(Font.system(size: 25))
                    } else {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(textColor)
                            .font(Font.system(size: 25))
                    }
                    
                }
                
                
                HStack {
                    VStack (alignment: .leading, spacing: 4) {
                        Text(course.code)
                            .font(.title.bold())
                        Text(course.name)
                            .font(Font.system(size: 16, weight: .semibold))
                        Text("\(course.members) members")
                            .font(.caption)
                    }
                }
                .foregroundStyle(textColor)
                .fontDesign(.rounded)
            }
            .frame(width: 150, height: 150, alignment: .leading)
            .padding(25)
            .background(course.color)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.normalTxt, lineWidth: 4)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CourseCard(course:  Course(code: "CSC 306", name: "Operating Systems", members: 82, image: "gearshape.2", color: .yellow), isMember: false) { }
}
