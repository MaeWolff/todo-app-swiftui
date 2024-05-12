import SwiftUI

@main
struct todo_appApp: App {
    var body: some Scene {
        let todoViewModel = TodoViewModel()
        WindowGroup {
            ContentView(todoViewModel: todoViewModel)
        }
    }
}
