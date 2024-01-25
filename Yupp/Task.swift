//
//  Tasks.swift
//  Yupp
//
//  Created by Hamza Osama on 12/11/2023.
//

import Foundation
import SwiftData

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var discription: String
    var sub: String
    var date: Date
    var complete: Bool
    var dueDate: Date
    
    init(title: String = "", discription: String = "", sub: String = "", date: Date = .now, complete: Bool = false, dueDate: Date = .now) {
        self.title = title
        self.discription = discription
        self.sub = sub
        self.date = date
        self.complete = complete
        self.dueDate = dueDate
    }
}
