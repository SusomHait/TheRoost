import SwiftUI

struct Dashboard2: View {
    let courses = Courses()

    @State private var expandedModule: String? = nil
    @State private var searchTxt: String = ""

    var body: some View {
        ZStack {
            VStack (spacing: 20) {
                HStack {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)

                        TextField("Search courses", text: $searchTxt)
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                    )
                    
                    // User Icon
                    Button("User Icon", systemImage: "person.circle") {
                        
                    }
                    .labelStyle(.iconOnly)
                    .font(Font.largeTitle)
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
                                
                                Text("Trending")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.largeTitle.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.trending) { course in
                                        CourseCard(
                                            course: course
                                        ) {
                                            withAnimation {
                                                expandedModule = course.code
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Computer Science
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "desktopcomputer.and.macbook")
                                Text("Computer Science")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.compSci) { course in
                                        CourseCard(
                                            course: course
                                        ) {
                                            withAnimation {
                                                expandedModule = course.code
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Math
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "pencil.and.ruler")
                                Text("Math")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.math) { course in
                                        CourseCard(
                                            course: course
                                        ) {
                                            withAnimation {
                                                expandedModule = course.code
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // English
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "books.vertical")
                                Text("English")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.english) { course in
                                        CourseCard(
                                            course: course
                                        ) {
                                            withAnimation {
                                                expandedModule = course.code
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Science
                        VStack (spacing: 10) {
                            HStack () {
                                Image(systemName: "atom")
                                Text("Science")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.title.bold())
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(courses.science) { course in
                                        CourseCard(
                                            course: course
                                        ) {
                                            withAnimation {
                                                expandedModule = course.code
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .opacity(expandedModule == nil ? 1 : 0.4)
            
            if let expandedModule {
                CardContent(
                    name: expandedModule,
                ) {
                    withAnimation() {
                        self.expandedModule = nil
                    }
                }
                .padding()
                .zIndex(1)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backing)
    }
}

#Preview {
    Dashboard2()
}
