import SwiftUI

struct LibraryView: View {
    
    // recieves the saved books array
    @Binding var books: [Book]
    
    var saveBooks: () -> Void
    
    var body: some View {
        List($books) { $book in
            
            NavigationLink {
                
                BookDetailView(book: $book, saveBook: saveBooks)
            } label: {
                
                VStack(alignment: .leading) {
                    
                    Text(book.title)
                        .font(.headline)
                    
                    Text("Pages: \(book.totalPages)")
                        .font(.subheadline)
                    
                    Text("Chapter: \(book.totalChapters)")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("My Library")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LibraryView(books: .constant([]), saveBooks: {})
}
