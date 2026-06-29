import Foundation

// stores all book information
struct Book: Identifiable, Codable {
    
    // unique ID for each saved book
    var id = UUID()
    
    // name of book
    var title: String = ""
    
    // Total pages in book
    var totalPages: Int = 0
    
    // current page user is on
    var currentPage: Int = 0
    
    // total number of chapters
    var totalChapters: Int = 0
    
    // chapters completed
    var completedChapters: Int = 0
    
    // notes
    var notes: String = ""
    
    
}
