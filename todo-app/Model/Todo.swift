import Foundation
import SwiftData

enum TodoStatus: String {
    case pending
    case completed
}

struct Todo: Identifiable {
    let id: UUID = UUID()
    let title: String
    var status: TodoStatus = .pending
}
