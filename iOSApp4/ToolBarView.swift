import SwiftUI

struct ToolBarView: View {
    
    @Binding var selectedScreen: AppScreen
    
    var body: some View {
        HStack(spacing: 60) {
            
            Button {
                selectedScreen = .addBook
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
            }
            
            Button {
                selectedScreen = .library
            } label: {
                Image(systemName: "books.vertical.fill")
                    .font(.largeTitle)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        
    }
}

#Preview {
    ToolBarView(selectedScreen: .constant(.addBook))
}

