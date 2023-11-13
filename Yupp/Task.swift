//
//  Tasks.swift
//  Yupp
//
//  Created by Hamza Osama on 12/11/2023.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var discription: String
    var sub: String
    var date: Date
    
    init(title: String = "", discription: String = "", sub: String = "", date: Date = .now) {
        self.title = title
        self.discription = discription
        self.sub = sub
        self.date = date
    }
}

