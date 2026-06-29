import SwiftUI

struct AddBookView: View {
    
    @State private var book = Book()
    @Binding var books: [Book]
    var saveBooks: () -> Void
    
    var body: some View {
        ZStack {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    Text("Textbook Study Tracker")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Textbook name", text: $book.title)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Total Pages")
                    TextField("Total pages", value: $book.totalPages, format: .number)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Total chapters")
                    TextField("Total chapters", value: $book.totalChapters, format: .number)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Book: \(book.title)")
                    
                    Button("Save to Library") {
                        book.currentPage = 0
                        book.completedChapters = 0
                        
                        books.append(book)
                        saveBooks()
                        
                        book = Book()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(80)
                
                
            }
        }
        
        
    }
    
}
#Preview {
    AddBookView(books: .constant([]), saveBooks: {})
}
