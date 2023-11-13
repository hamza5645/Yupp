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
    @Environment(\.modelContext) var modelContext
    @Query var tasks: [Task]
    @State private var path = [Task]()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                ForEach(tasks) { tasks in
                    NavigationLink(value: tasks) {
                        VStack(alignment: .leading) {
                            Text(tasks.title)
                                .font(.headline)
                            
                            Text(tasks.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationDestination(for: Task.self, destination: EditView.init)
            .navigationTitle("Title")
            .toolbar {
                Button("Add Samples", action: addSample)
                Button("Add Task", action: addTask)
            }
        }
//        VStack {
//            //Title and Bar
//            HStack {
//                Text("Personal")
//                    .font(.system(size: 34))
//                    .padding()
//                
//                Spacer()
//                //Dot View
//                DotView(color: .primary, hasTrailingPadding: false)
//                DotView(color: .secondary, hasTrailingPadding: false)
//                DotView(color: .secondary, hasTrailingPadding: false)
//                DotView(color: .secondary, hasTrailingPadding: true)
//                
//            }
//            .padding(.bottom)
//            
//            VStack {
//                //Task View
//                TaskView(title: "Swipe Right (Done)")
//                TaskView(title: "Swipe Left (Delete)")
//                TaskView(title: "Swipe Down (Add)")
//            }
//            Spacer()
//        }
    }
    func addSample() {
        let work = Task(title: "Work")
        let study = Task(title: "Study")
        let home = Task(title: "Home")
        
        modelContext.insert(work)
        modelContext.insert(study)
        modelContext.insert(home)
    }
    
    func addTask() {
        let task = Task()
        modelContext.insert(task)
        path = [task]
    }
    
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

//Single Task Structure
struct TaskView: View {
    var title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(yellowCustom)
                .cornerRadius(5)
                .padding([.trailing, .leading])
            Text(title)
                .font(.system(size: 30))
                .foregroundStyle(.black)
        }
    }
}


#Preview {
    ContentView()
}
