import SwiftUI

struct CardContent: View {
    let name: String
    let action: () -> Void

    var body: some View {
        VStack (alignment: .leading) {
            ZStack {
                VStack (spacing: 8) {
                    Text("\(name)")
                        .font(.largeTitle.bold())
                    
                    Text("Course Name")
                        .font(Font.system(size: 18))
                }
                .padding(.top, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                Button("Close", systemImage: "multiply.circle", action: action)
                    .labelStyle(.iconOnly)
                    .font(Font.system(size: 40))
                    .tint(Color.black)
                    .padding(.trailing, 20)
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(.accent)
            .foregroundStyle(Color.black)
            
            ScrollView {
                Text("This is a sample description of the study group. This group is really cool and will help you study better. We are focused on enhancing the expereince of other students while cultivating a fun environment. ")
            }
            .padding(20)
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    Text("Member Count: 20")
                }
                .padding(.trailing, 20)
                .padding(.leading, 20)
                
                HStack (spacing: 10) {
                    Button (action: {}) {
                        HStack {
                            Text("Join Group")
                            Image(systemName: "plus.circle")
                        }
                        .font(Font.system(size: 20))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.black)
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: 80)
                }
            }
            .padding()
            .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.backing)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .shadow(radius: 20)
    }
}

#Preview {
    CardContent(name: "Sample") { }
}
