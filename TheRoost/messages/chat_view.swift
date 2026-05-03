import SwiftUI

struct ChatView: View {
    @Binding var course: Course
    @Binding var user: sampleUser
    
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack(spacing: 0){
            ScrollViewReader { proxy in
                ScrollView{
                    LazyVStack(spacing: 12) {
                        ForEach(course.messages) { message in
                            bubbleView(for: message)
                        }
                    }
                    .padding()
                }
                .onChange(of: course.messages.count) {
                    withAnimation {
                        proxy.scrollTo(course.messages.last?.id, anchor: .bottom)
                    }
                }
            }
            
            // Action bar for group features
            HStack(spacing: 12) {
                Button {
                    handleGroupQuiz()
                } label: {
                    Label("Quiz", systemImage: "rectangle.stack.badge.person.crop")
                        .labelStyle(.iconOnly)
                        .padding(10)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(Color.contrast.opacity(0.08))
                        )
                }

                Button {
                    handleGroupNotes()
                } label: {
                    Label("Notes", systemImage: "pencil.and.list.clipboard")
                        .labelStyle(.iconOnly)
                        .padding(10)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(Color.contrast.opacity(0.08))
                        )
                }

                Spacer()
            }
            .foregroundStyle(.contrast)
            .font(Font.system(size: 25))
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(.headerTxt)
            
            HStack(spacing: 12) {
                TextField("Type a message...", text: $newMessage, axis: .vertical)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .lineLimit(1...5)
                
                Button {
                    sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 24))
                        .foregroundStyle(newMessage.isEmpty ? .gray : .accent)
                }
                .disabled(newMessage.isEmpty)
            }
            .padding()
            .background(.panel)
            
        }
        .background(.backing)
        .navigationTitle(course.code)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: course.image)
                    Text(course.code).bold()
                }
                .foregroundStyle(.headerTxt)
            }
        }
        
    }
    
    
    @ViewBuilder
    func bubbleView(for message: Message) -> some View {
        HStack{
            if message.isCurrentUser {Spacer()}
            
            Text(message.text)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(message.isCurrentUser ? Color.blue :Color(.systemGray5))
                .foregroundColor(message.isCurrentUser ? .white : .primary)
                .cornerRadius(20)
                .frame(maxWidth: 280, alignment: message.isCurrentUser ? .trailing : .leading)
            
            if !message.isCurrentUser {Spacer()}
        }
        .id(message.id)
    }
    
    func sendMessage() {
        let message = Message(text: newMessage, isCurrentUser: true)
        course.messages.append(message)
        self.newMessage = ""
    }
    
    func handleGroupQuiz() {
        // TODO: Present group quiz/flashcards UI
        // e.g., navigate, present a sheet, or send a system message
        print("Group Quiz tapped")
    }

    func handleGroupNotes() {
        // TODO: Present group notes UI
        // e.g., navigate, present a sheet, or send a system message
        print("Group Notes tapped")
    }
}
