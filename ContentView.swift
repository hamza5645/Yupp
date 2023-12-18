//
//  ContentView.swift
//  Yupp
//
//  Created by Hamza Osama on 12/11/2023.
//

import SwiftUI
import SwiftData

// Custom Yellow
let yellowCustom = Color(red: 1, green: 0.811, blue: 0, opacity: 1.0)

struct ContentView: View {
    //SwiftData
    @Environment(\.modelContext) var modelContext
    @Query var task: [Task]
    @State private var path = [Task]()
    @State private var isDragging = false
    
    var body: some View {
        //Tasks View
        NavigationStack(path: $path) {
            VStack {
                ScrollView {
                    ForEach(task) { taskItem in
                        SwipeToDeleteView(task: taskItem, onDelete: {
                            deleteTask(taskItem)
                        })
                    }
                    Spacer()
                }
            }
            .navigationDestination(for: Task.self, destination: EditView.init)
            .navigationTitle("Tasks")
            .toolbar {
                Button("Add Task", action: addTask)
            }
        }
        
        .gesture(
            DragGesture()
                .onChanged{ value in
                    if value.translation.height > 0 && !isDragging {
                        addTask()
                        print("Done")
                        isDragging = true
                    }
                }
                .onEnded { _ in
                    isDragging = false
                }
        )
        
    }
    // addTask
    func addTask() {
        let task = Task()
        isEditing = true
        modelContext.insert(task)
    }
    //deleteTask
    private func deleteTask(_ taskToDelete: Task) {
        if let index = task.firstIndex(where: { $0.id == taskToDelete.id }) {
            modelContext.delete(taskToDelete)
        }
    }
}

struct SwipeToDeleteView: View {
    var task: Task
    var onDelete: () -> Void
    @State private var offset = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            TasksView(task: task)
                .offset(x: offset.width)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width < 0 { // Left swipe
                                self.offset = gesture.translation
                            }
                        }
                        .onEnded { _ in
                            if self.offset.width < -100 { // Threshold for deletion
                                onDelete()
                            } else {
                                self.offset = .zero
                            }
                        }
                )

            if offset.width < 0 {
                Button(action: onDelete) {
                    Text("Delete")
                        .frame(width: -offset.width, height: 40)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(20) // Makes the button rounded
                        .padding(.trailing, -offset.width > 100 ? 0 : -offset.width - 100) // Adjusts padding for text wrapping
                }
            }
        }
    }
}



//Dot View Structure
struct DotView: View {
    var color: Color
    var hasTrailingPadding: Bool
    
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundStyle(color)
            .padding([.top, .bottom], 20)
            .padding(.trailing, hasTrailingPadding ? 20 : 0)
    }
}
