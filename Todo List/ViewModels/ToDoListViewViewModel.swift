//
//  ToDoListViewViewModel.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init() {
    }
    
    func deleteItem(id: String) {
    }
    
    func editItem(id: String, title: String, dueDate: TimeInterval) {        
    }
}
