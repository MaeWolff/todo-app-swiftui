import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    init() {
        self.todos = getAllTodos()
    }
    
    func getAllTodos() -> [Todo] {
        if let savedTodos: [Todo] = StorageManager.load(forKey: StorageKeys.todos, as: [Todo].self) {
            return savedTodos
        }
        return []
    }
    
    func saveTodos() {
        StorageManager.save(object: todos, forKey: StorageKeys.todos)
    }
    
    func add(title: String) {
        let newTodo = Todo(title: title, isCompleted: false)
        todos.append(newTodo)
        saveTodos()
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        saveTodos()
    }
    
    func toggleStatus(todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            saveTodos()
        }
    }
}
