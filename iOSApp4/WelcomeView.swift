import SwiftUI

struct WelcomeView: View {
    
    @Binding var selectedScreen: AppScreen
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("Study Tracker")
                .font(.system(size: 42))
                .bold()
            Image(systemName: "book.closed.fill")
                .font(.system(size: 100))
            
            Button("Start") {
                selectedScreen = .addBook
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            Spacer()
        }
    }
}

#Preview {
    WelcomeView(selectedScreen: .constant(.welcome))
}
