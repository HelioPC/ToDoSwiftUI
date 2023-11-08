//
//  ToDoListViewViewModel.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
