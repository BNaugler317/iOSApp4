import SwiftUI

enum AppScreen {
    case welcome
    case addBook
    case library
}

struct ContentView: View {
    
    @State private var selectedScreen: AppScreen = .welcome
    
    // stores all books added by user
    @State private var books: [Book] = []
    
    // key use to save and load books from UserDefaults
    let bookKey = "savedBooks"
    
    // saves books array using JSON encoding
    func saveBooks() {
        if let encodedData = try? JSONEncoder().encode(books) {
            UserDefaults.standard.set(encodedData, forKey: bookKey)
        }
    }
    
    // loads the books array using JSON decoding
    func loadBooks() {
        if let savedData = UserDefaults.standard.data(forKey: bookKey) {
            if let decodedBooks = try? JSONDecoder().decode([Book].self, from: savedData) { books = decodedBooks
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            if selectedScreen == .welcome {
                
                WelcomeView(selectedScreen: $selectedScreen)
            } else {
                
                ZStack(alignment: .bottom) {
                    
                    if selectedScreen == .addBook {
                        AddBookView(books: $books, saveBooks: saveBooks)
                    } else {
                        LibraryView(books: $books, saveBooks: saveBooks)
                    }
                    
                    ToolBarView(selectedScreen: $selectedScreen)
                    
                }
            }
        }
        .onAppear {
            loadBooks()
        }
    }
    
    
    
}
    #Preview {
        ContentView()
    }

