import SwiftUI

struct ContentView: View {
    @ObservedObject var todoViewModel: TodoViewModel
    @State private var newTodoTitle: String = ""
    

    var body: some View {
        NavigationView {
            List {
                HStack {
                    TextField("New todo", text: $newTodoTitle)
                    Button(action: {
                        self.addTodo()
                    }) {
                        Text("Add")
                    }
                }
                ForEach(todoViewModel.todos) { todo in
                    TodoCard(todo: todo)
                }.onDelete(perform: todoViewModel.delete)
            }
            .listRowSpacing(12)
            .navigationBarTitle("ToDo List")
        }
    }
    
    func addTodo() {
        guard !newTodoTitle.isEmpty else {
            return
        }
        todoViewModel.add(title: newTodoTitle)
        newTodoTitle = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let todoViewModel = TodoViewModel()
        ContentView(todoViewModel: todoViewModel)
    }
}
