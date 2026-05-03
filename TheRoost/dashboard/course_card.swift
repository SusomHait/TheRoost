import SwiftUI

struct CourseCard: View {
    let course: Course
    let action: () -> Void
    
    private var textColor: Color {
        course.color.isDark ? .white : .black
    }

    var body: some View {
        Button(action: action) {
            VStack (alignment: .leading) {
                Image(systemName: course.image)
                    .font(.largeTitle.bold())
                    .foregroundStyle(textColor)
                    .frame(width: 75, height: 75)
                    .background(
                        Circle()
                            .fill(Color.black.opacity(0.08))
                    )
                
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
                    .stroke(textColor, lineWidth: 4)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CourseCard(course:  Course(code: "CSC 306", name: "Operating Systems", members: 82, image: "gearshape.2", color: .yellow)) { }
}
