import SwiftUI

struct Messages : View {
    @Binding var user: sampleUser
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "message.circle")
                        Text("Your Messages")
                            .bold()
                        
                        Spacer()
                    }
                    .foregroundStyle(.headerTxt)
                    .font(.largeTitle)
                    
                    ScrollView {
                        Divider()
                        
                        ForEach($user.courses) { $course in
                            NavigationLink {
                                ChatView(course: $course, user: $user)
                            } label: {
                                VStack {
                                    HStack(spacing: 24) {
                                        Image(systemName: course.image)
                                            .font(Font.system(size: 20))
                                        
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(course.code)
                                                    .font(.title.bold())
                                                
                                                Spacer()
                                                
                                                Text(Date.now, format: .dateTime
                                                    .month()
                                                    .day()
                                                    .year()
                                                )
                                                .font(.caption)
                                            }
                                            
                                            HStack {
                                                Text(course.messages.last?.text ?? "No messages yet")
                                                    .font(.subheadline)
                                                    .lineLimit(1)
                                                    .truncationMode(.tail)
                                                    .foregroundStyle(Color.secondary)
                                            }
                                        }
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .fontDesign(.rounded)
                .foregroundStyle(.normalTxt)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.backing)
            }
        }
        .fontDesign(.rounded)
    }
}
