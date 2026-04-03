import SwiftUI

struct NavigationBar : View {
    var body: some View {
        let pages: [AnyView] = [
            AnyView(Dashboard()),
            AnyView(Messages()),
            AnyView(Dashboard()),
            AnyView(Messages())
        ]
        
        let icons: [String] = [
            "house.fill",
            "plus.circle.fill",
            "ellipsis.message.fill",
            "person.crop.circle"
        ]
        
        VStack (spacing: 15) {
            Divider()
                .background(Color(.black))
            
            HStack (spacing: 40) {
                ForEach (icons.indices, id: \.self) { index in
                    
                    
                    NavigationLink(destination: pages[index]) {
                        Image(systemName: icons[index])
                            .font(Font.system(size: 25))
                            .foregroundStyle(Color(.black))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationBar()
}
