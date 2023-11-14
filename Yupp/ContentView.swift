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
    @Query var tasks: [Task]
    @State private var path = [Task]()
    
    var body: some View {
        
        //Tasks View
        NavigationStack(path: $path) {
            VStack {
                ForEach(tasks) { tasks in
                    NavigationLink(value: tasks) {
                        VStack(alignment: .leading) {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(yellowCustom)
                                    .cornerRadius(5)
                                HStack {
                                    Text(tasks.title)
                                        .font(.system(size: 30))
                                        .foregroundStyle(.black)
                                        .padding()
                                    Spacer()
                                }
                            }
                            .frame(height: 60)
                            .padding([.trailing, .leading, .bottom])
                        }
                    }
                }
                .onDelete(perform: deleteTask)
                Spacer()
            }
            .navigationDestination(for: Task.self, destination: EditView.init)
            .navigationTitle("Tasks")
            .toolbar {
                Button("Add Task", action: addTask)
            }
        }
    }
    
    // addTask
    func addTask() {
        let task = Task()
        modelContext.insert(task)
    }
    
    // deleteTask
    func deleteTask(_ indexSet: IndexSet) {
        for index in indexSet {
            let task = tasks[index]
            modelContext.delete(task)
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

#Preview {
    ContentView()
}
