//
//  CompleteTask.swift
//  Yupp
//
//  Created by Hamza Osama on 2/13/24.
//

import Foundation
import AppIntents
import SwiftData

struct CompleteTask: AppIntent {
    static var title: LocalizedStringResource = "Toggle Complete"
    static var description: IntentDescription? = "Toggle whether a task is completed"
    
    @Parameter(title: "Task Title")
    var tasksTitle : String
    
    init() {
        tasksTitle = ""
    }
    init(tasksTitle: String) {
        self.tasksTitle = tasksTitle
    }
    
    func perform() async throws -> some IntentResult {
        guard let modelContainer = try? ModelContainer(for: Task.self) else {
            return .result()
        }
        let descriptor = FetchDescriptor<Task>(predicate: #Predicate { task in
            task.title == tasksTitle
        })
        let Task = try? await modelContainer.mainContext.fetch(descriptor)
        
        if let task = Task?.first {
            let complete = task.complete
            task.complete = !complete
        }
        
        return.result()
    }
}
