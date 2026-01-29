//
//  ContentView.swift
//  TaskTracker
//
//  Created by Joshua  Donatien on 1/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks = Task.sampleTasks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    NavigationLink(destination: TaskDetailView(task: $task)) {
                        TaskRowView(task: task)
                    }
                }
            }
            .navigationTitle("My Tasks")
        }
    }
}

struct TaskRowView: View {
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.headline)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            if task.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title2)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
