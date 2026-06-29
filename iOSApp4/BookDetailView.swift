import SwiftUI

struct BookDetailView: View {
    
    @Binding var book: Book
    
    var saveBook: () -> Void
    @State private var showNotes = false
    @State private var newNote = ""
    @State private var readingDeadLine = Date()
    
    
    var pageProgress: Double {
        if book.totalPages == 0 {
            return 0
        }
        return Double(book.currentPage) / Double(book.totalPages)
    }
    
    var chapterProgress: Double {
        if book.totalChapters == 0 {
            return 0
        }
        return Double(book.completedChapters) / Double(book.totalChapters)
    }
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 20) {
                
                // Basic Details Card
                VStack(spacing: 10) {
                    
                    Text(book.title)
                        .font(.largeTitle)
                        .bold()
                    Text("Total Pages: \(book.totalPages)")
                    
                    Text("Total Chapters: \(book.totalChapters)")
                }
                .padding()
                .frame(maxWidth: 300)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // deadline date picker
                VStack(spacing: 15) {
                    
                    Text("Reading Deadline")
                        .font(.title2)
                        .bold()
                    
                    DatePicker("Choose Deadline", selection: $readingDeadLine, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
                .padding()
                .frame(maxWidth: 400)
                .background((Color.gray.opacity(0.2)))
                .cornerRadius(20)
                
                HStack(spacing: 10) {
                    // page progress Card
                    VStack(spacing: 15) {
                        
                        Text("Page Progress")
                            .font(.title2)
                            .bold()
                        
                        ProgressView(value: pageProgress)
                            .scaleEffect(x: 1, y: 8, anchor: .center)
                            .padding(.horizontal)
                        
                        Text("Page \(book.currentPage) of \(book.totalPages)")
                        
                        Button("Page Read") {
                            
                            if book.currentPage < book.totalPages {
                                book.currentPage += 1
                                saveBook()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 260)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    
                    // Chapter Progress Card
                    VStack(spacing: 15) {
                        
                        Text("Chapter Progress")
                            .font(.title2)
                            .bold()
                        
                        CircularProgressView(progress: chapterProgress)
                        
                        Text("Chapter \(book.completedChapters) of \(book.totalChapters)")
                        
                        Button("Completed Chapter") {
                            
                            if book.completedChapters < book.totalChapters {
                                book.completedChapters += 1
                                saveBook()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 260)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    
                }
                
                // Notes Card
                VStack(spacing: 15) {
                    
                    Button("Study Notes") {
                        showNotes.toggle()
                    }
                    .buttonStyle(.bordered)
                    
                    if showNotes {
                        
                        TextField("Enter study notes", text: $newNote)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Save Note") {
                            
                            book.notes += "\n. \(newNote)"
                            newNote = ""
                            saveBook()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Text("Study Notes")
                        .font(.title2)
                        .bold()
                    
                    Text(book.notes)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button("Clear Notes") {
                        book.notes = ""
                        saveBook()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            }
            .padding()
        }
    }
}

#Preview {
    BookDetailView(book: .constant(Book(title: "Sample Book", totalPages: 300,
    currentPage: 0, totalChapters: 12, completedChapters: 0,notes: "")),
    saveBook: {}
    )
}
