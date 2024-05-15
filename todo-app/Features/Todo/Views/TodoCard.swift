import SwiftUI

struct TodoCard: View {
    var todo: Todo
    var toggleStatus: () -> Void

    var body: some View {
        let isCompleted: Bool = todo.status.rawValue == "completed"
        
        HStack() {
            ZStack {
                Circle()
                    .stroke(Color.text, lineWidth: 2)
                    .fill(isCompleted ? Color.one : Color.background)
                    .frame(width: 32, height: 32)
                    .padding(.horizontal, 20)
                
                if isCompleted {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.text)
                }
            }
            
            Text(todo.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 24)
                .strikethrough(isCompleted)
                .foregroundColor(Color.text)
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.background)
                .shadow(color: Color.one,radius: 0, x: 8, y: 8)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.text)
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .onTapGesture {
            toggleStatus()
        }
        .contentShape(Rectangle())
        .opacity(isCompleted ? 0.5 : 1)
       
    }
        
}

#Preview {
    TodoListView()
}
