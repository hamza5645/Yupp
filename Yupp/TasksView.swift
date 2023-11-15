//
//  TasksView.swift
//  Yupp
//
//  Created by Hamza Osama on 15/11/2023.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Bindable var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundStyle(yellowCustom)
                    .cornerRadius(5)
                HStack {
                    TextField("What do you want to do?", text: $task.title)
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

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Task.self, configurations: config)
        let example = Task(title: "Example Title", discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.", sub: "This is a subtask", date: .now)
        return EditView(task: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }

}

