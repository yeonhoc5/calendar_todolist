//
//  Date.swift
//  Pods
//
//  Created by YHChoi on 2022/07/25.
//

import Foundation

struct MissionDate {
    var date: Date!
    var todoList: [ToDoThing]
}

struct ToDoThing {
    var titleToDo: String
    var done: Bool
}
