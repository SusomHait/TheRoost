import SwiftUI

struct Dashboard: View {
    let modules = ["CSC 101", "CSC 102", "CSC 302", "CSC 307", "CSC 326", "CSC 424"]

    @State private var expandedModule: String? = nil

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(modules, id: \.self) { module in
                        CardThumbnail(
                            name: module,
                        ) {
                            withAnimation() {
                                expandedModule = module
                            }
                        }
                    }
                }
                .padding()
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
    Dashboard()
}
