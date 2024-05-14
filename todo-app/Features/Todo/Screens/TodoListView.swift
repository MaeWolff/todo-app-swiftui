//
//  TodoView.swift
//  todo-app
//
//  Created by Maxence Wolff on 14/05/2024.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var todoViewModel: TodoViewModel = TodoViewModel()
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        VStack {
            Text("Daily Todo's")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Spacer(minLength: 40)
            
            // Input to add new todo
            HStack {
                ZStack {
                    TextField("New todo", text: $newTodoTitle)
                        .padding(20)
                }
                .frame(height: 60)
                .foregroundColor(Color.text)
                .clipShape(.rect(cornerRadius: 8))
                .font(.title2)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.outline))
      
                
                Button("Add") {
                    self.addTodo()
                }
                .frame(height: 60)
                .frame(width: 100)
                .font(.title2)
                .background(Color.one)
                .foregroundColor(Color.background)
                .clipShape(.rect(cornerRadius: 8))
            }
            .padding(.horizontal, 18)
            
            Spacer(minLength: 32)
            
            // Todo list
            NavigationView {
                List {
                    ForEach(todoViewModel.todos) { todo in
                        TodoCard(todo: todo) {
                            todoViewModel.toggleStatus(todo: todo)
                        }
                    }
                    .onDelete(perform: todoViewModel.delete)
                    .listRowBackground(Color.background)
                }
                .background(Color.background)
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.background)
        .foregroundColor(Color.text)
    }
    
    func addTodo() {
        guard !newTodoTitle.isEmpty else {
            return
        }
        todoViewModel.add(title: newTodoTitle)
        newTodoTitle = ""
    }
}

#Preview {
    TodoListView()
}
