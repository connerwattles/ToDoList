//
//  ContentView.swift
//  ToDoList
//
//  Created by Conner Wattles on 2/13/24.
//

import SwiftUI

struct TaskItem: Identifiable {
    var id = UUID()
    var name: String
    var completed: Bool = false
}

struct ContentView: View {
    @State private var newTaskName = ""
    @State private var tasks: [TaskItem] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter task name", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: addTask) {
                    Text("Add Task")
                }
                .padding(.horizontal)
            }
            
            List {
                ForEach(tasks) { task in
                    HStack {
                        Button(action: {
                            toggleTaskCompleted(task)
                        }) {
                            Image(systemName: task.completed ? "checkmark.square" : "square")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        Text(task.name)
                            .strikethrough(task.completed)
                        
                        Spacer()
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding(.top)
    }
    
    func addTask() {
        guard !newTaskName.isEmpty else { return }
        tasks.append(TaskItem(name: newTaskName))
        newTaskName = ""
    }
    
    func toggleTaskCompleted(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
        }
    }
}

#Preview {
    ContentView()
}
