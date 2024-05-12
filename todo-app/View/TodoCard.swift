import SwiftUI

struct TodoCard: View {
    var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            StatusIndicator(status: todo.status)
            Text(todo.title).font(.title3)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct StatusIndicator: View {
    var status: TodoStatus
    
    var body: some View {
        let backgroundColor: Color = {
            switch status {
            case .completed: Color.green
            case .pending: Color.orange
            }
        }()
        
        Text(status == .completed ? "completed" : "pending")
            .font(.footnote)
            .foregroundColor(Color.white)
            .padding(8)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}
