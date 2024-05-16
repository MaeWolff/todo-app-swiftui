import Foundation

struct Todo: Identifiable, Codable {
    let id: UUID
    let title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
    }
}
