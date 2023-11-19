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
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundStyle(yellowCustom)
                    .cornerRadius(5)
                HStack {
                    if isEditing {
                        TextField("What do you want to do?", text: $task.title)
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .padding()
                            .onSubmit {
                                isEditing = false
                            }
                    } else {
                        Text(task.title)
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .padding()
                    }
                    Spacer()
                }
            }
            .frame(height: 60)
            .padding([.trailing, .leading, .bottom])
        }
    }
}
