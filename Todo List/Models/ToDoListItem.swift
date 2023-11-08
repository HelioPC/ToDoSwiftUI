//
//  ToDoListItem.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    var title: String
    var dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
    mutating func setTitle(_ state: String) {
        title = state
    }
    
    mutating func setDueDate(_ state: TimeInterval) {
        dueDate = state
    }
}
