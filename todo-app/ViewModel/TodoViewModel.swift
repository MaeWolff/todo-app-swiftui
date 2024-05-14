import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = [
        Todo(title: "Learn React Native", status: .completed),
        Todo(title: "Create todo app", status: .pending)
    ]
    
    func add(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func toggleStatus(todo: Todo) {
         if let index = todos.firstIndex(where: { $0.id == todo.id }) {
             todos[index].status = (todos[index].status == .pending) ? .completed : .pending
         }
     }
}
