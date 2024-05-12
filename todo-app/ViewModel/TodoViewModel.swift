import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = [
        Todo(title: "Create Todo App with SwiftUI", status: .completed)
    ]
    
    func add(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}
