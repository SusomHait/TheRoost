import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isCurrentUser: Bool
}

struct ChatView: View {
    @State private var messages: [Message] = [
        Message(text: "Hello, type something to start a chat", isCurrentUser: false) ]
    
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack(spacing: 0){
            ScrollViewReader { proxy in
                ScrollView{
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            bubbleView(for: message)
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) {
                    withAnimation {
                        proxy.scrollTo(messages.last?.id, anchor: .bottom)
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
                        .font(.system(size: 25, weight: .medium))
                        .padding(10)
                        .background(.thinMaterial)
                        .clipShape(Capsule())
                }

                Button {
                    handleGroupNotes()
                } label: {
                    Label("Notes", systemImage: "pencil.and.list.clipboard")
                        .labelStyle(.iconOnly)
                        .font(.system(size: 25, weight: .medium))
                        .padding(10)
                        .background(.thinMaterial)
                        .clipShape(Capsule())
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(.ultraThinMaterial)
            
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
                        .foregroundStyle(newMessage.isEmpty ? .gray : .blue)
                }
                .disabled(newMessage.isEmpty)
            }
            .padding()
            .background(.ultraThinMaterial)
            
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
        messages.append(message)
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

#Preview {
    ChatView()
}
