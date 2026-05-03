import SwiftUI

struct Dashboard: View {
    @Binding var courses: Courses

    @State private var searchTxt: String = ""
    @State private var addingGroup: Bool = false
    @State private var expandedModule: Course? = nil
    
    @Binding var user: sampleUser
    
    func isMember(course: Course) -> Bool {
        user.courses.contains { val in
            val.code == course.code
        }
    }

    var body: some View {
        ZStack {
            VStack (spacing: 20) {
                HStack {
                    HStack {
                        Image(systemName: "bird.circle")
                        Text("The Roost")
                            .bold()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button("Add Group", systemImage: "plus.circle") {
                            addingGroup = true
                        }
                        .labelStyle(.iconOnly)
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(.headerTxt)
                .padding(.horizontal)
                .font(.largeTitle)
                    
                HStack {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)

                        TextField("Search courses", text: $searchTxt)
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                    )
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack (spacing: 24) {
                        
                        // Trending
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "flame.fill")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.red)
                                
                                Text("Popular")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.trending) { course in
                                        CourseCard(
                                            course: course,
                                            isMember: isMember(course: course)
                                        ) {
                                            withAnimation {
                                                expandedModule = course
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                            }
                        }
                        
                        // Computer Science
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "desktopcomputer.and.macbook")
                                    .foregroundStyle(.teal)
                                Text("Computer Science")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.compSci) { course in
                                        CourseCard(
                                            course: course,
                                            isMember: isMember(course: course)
                                        ) {
                                            withAnimation {
                                                expandedModule = course
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                            }
                        }
                        
                        // Math
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "pencil.and.ruler")
                                    .foregroundStyle(.orange)
                                Text("Math")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.math) { course in
                                        CourseCard(
                                            course: course,
                                            isMember: isMember(course: course)
                                        ) {
                                            withAnimation {
                                                expandedModule = course
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                            }
                        }
                        
                        // English
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "books.vertical")
                                    .foregroundStyle(.brown)
                                Text("English")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.english) { course in
                                        CourseCard(
                                            course: course,
                                            isMember: isMember(course: course)
                                        ) {
                                            withAnimation {
                                                expandedModule = course
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                            }
                        }
                        
                        // Science
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "atom")
                                    .foregroundStyle(.green)
                                Text("Science")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.science) { course in
                                        CourseCard(
                                            course: course,
                                            isMember: isMember(course: course)
                                        ) {
                                            withAnimation {
                                                expandedModule = course
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
                .sheet(isPresented: $addingGroup) {
                    GroupAdd(courses: $courses)
                        .presentationDetents([.height(500), .large])
                        .presentationDragIndicator(.visible)
                }
                .sheet(item: $expandedModule) { course in
                    CardContent(
                        course: course,
                        isMember: isMember(course: course),
                        user: $user
                    )
                        .presentationDetents([.height(500)])
                        .presentationDragIndicator(.visible)
                }
            }
            .fontDesign(.rounded)
        }
        .foregroundStyle(.normalTxt)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backing)
    }
}
