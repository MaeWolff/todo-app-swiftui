import SwiftUI

struct TodoCard: View {
    var todo: Todo
    var toggleStatus: () -> Void

    var body: some View {
        let isCompleted: Bool = todo.status.rawValue == "completed"
        
        HStack() {
            ZStack {
                Circle()
                    .strokeBorder(Color.white)
                    .fill(isCompleted ? Color.outline : Color.background)
                    .frame(width: 32, height: 32)
                    .padding(.horizontal, 20)
                
                if isCompleted {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.text.opacity(0.2))
                }
            }
            
            Text(todo.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 24)
                .strikethrough(isCompleted)
                .foregroundColor(isCompleted ? Color.text.opacity(0.2) : Color.text)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.outline)
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .onTapGesture {
            toggleStatus()
        }
        .contentShape(Rectangle())
    }
}


struct TodoCard_Previews: PreviewProvider {
    static var previews: some View {
        let todoViewModel = TodoViewModel()
        ContentView(todoViewModel: todoViewModel)
    }
}

