import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    init() {
        self.todos = getAllTodos()
    }
    
    
    func getAllTodos() ->[Todo] {
        if let todosData = UserDefaults.standard.object(forKey: "todos") as? Data {
            if let todos = try? JSONDecoder().decode([Todo].self, from: todosData){
                return todos
            }
        }
        return []
    }
    
    func saveTodos() {
         if let encoded = try? JSONEncoder().encode(todos) {
             UserDefaults.standard.set(encoded, forKey: "todos")
         }
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
