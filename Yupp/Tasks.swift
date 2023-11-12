//
//  Tasks.swift
//  Yupp
//
//  Created by Hamza Osama on 12/11/2023.
//

import Foundation
import SwiftData

@Model
class Tasks {
    var title: String
    var discription: String
    var sub: String
    var date: Date
    var priority: Int
    
    init(title: String = "", discription: String = "", sub: String = "", date: Date = .now, priority: Int = 2) {
        self.title = title
        self.discription = discription
        self.sub = sub
        self.date = date
        self.priority = priority
    }
}

