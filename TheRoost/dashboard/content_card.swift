import SwiftUI

struct CardContent: View {
    let course: Course

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
                    Button (action: { dismiss() }) {
                        HStack {
                            Text("Join Group")
                            Image(systemName: "plus.circle")
                        }
                        .font(.headline.bold())
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.contrast)
                        .padding(14)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.headerTxt)
                        )
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.backing)
    }
}

#Preview {
    CardContent(course: Course(code: "CSC 306", name: "Operating Systems", members: 82, image: "gearshape.2", color: .yellow))
}
