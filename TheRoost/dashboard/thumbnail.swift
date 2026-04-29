import SwiftUI

struct CardThumbnail: View {
    let name: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: 4) {
                        Text(name)
                            .font(.largeTitle.bold())
                        
                        Text("Name")
                            .font(Font.system(size: 18))
                    }
                    .padding(.vertical, 40)
                    .padding(.leading, 40)
                    .padding(.trailing, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    ZStack {
                        Text("20")
                            .font(.largeTitle.bold())
                    }
                    .frame(width: 70, height: 70)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(.black, lineWidth: 3)
                    )
                    .padding(.vertical, 40)
                    .padding(.trailing, 40)
                    .padding(.leading, 20)
                    
                }
                .foregroundStyle(.black)
            }
            .frame(width: .infinity, height: 160)
            .frame(maxWidth: .infinity)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(radius: 10)
        }
    }
}

#Preview {
    CardThumbnail(name: "Sample") { }
}
