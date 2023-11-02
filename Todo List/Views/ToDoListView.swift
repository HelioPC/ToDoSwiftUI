//
//  ToDoListItemsView.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import SwiftUI

struct ToDoListView: View {
    private let usrId: String
    @StateObject var viewModel = ToDoListViewViewModel()
    
    init(userId: String) {
        self.usrId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
