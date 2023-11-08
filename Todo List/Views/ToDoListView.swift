//
//  ToDoListItemsView.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    @State var editItem: ToDoListItem? = nil
    
    init(userId: String) {
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }

    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteItem(id: item.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }

                            Button {
                                editItem = item
                                viewModel.showingNewItemView = true
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(todoItem: editItem, newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "4g8KxqbqkifM4d0nykhHva6Omk52")
    }
}
