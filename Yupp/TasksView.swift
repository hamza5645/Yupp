//
//  TasksView.swift
//  Yupp
//
//  Created by Hamza Osama on 15/11/2023.
//

import SwiftUI
import SwiftData

var isEditing: Bool = false

struct TasksView: View {
    @Bindable var task: Task
    
    var body: some View {
        HStack {
            if isEditing {
                TextField("What do you want to do?", text: $task.title)
                    .onSubmit {
                        isEditing = false
                        task.priority = 0
                    }
            } else {
                NavigationLink(task.title, destination: DetailedView(task: task))
            }
        }
    }
}
