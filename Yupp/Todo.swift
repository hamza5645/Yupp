//
//  Todo.swift
//  Yupp
//
//  Created by Hamza Osama on 3/24/24.
//

import SwiftUI
import SwiftData

@Model
class Todo {
    private(set) var taskID: String = UUID().uuidString
    var title: String
    var discription: String
    var sub: String
    var date: Date = Date.now
    var isCompleted: Bool = false
    var priority: Priority = Priority.normal
    
    init(taskID: String, title: String, discription: String, sub: String, date: Date, isCompleted: Bool, priority: Priority) {
        self.taskID = taskID
        self.title = title
        self.discription = discription
        self.sub = sub
        self.date = date
        self.isCompleted = isCompleted
        self.priority = priority
    }
}

//Priority Status
enum Priority: String, Codable, CaseIterable {
    case normal = "Normal"
    case mediuam = "Medium"
    case high = "High"
    
    //Priority Color
    var color: Color {
        switch self {
        case .normal:
            return.green
        case .mediuam:
            return.yellow
        case .high:
            return.red
        }
    }
}
