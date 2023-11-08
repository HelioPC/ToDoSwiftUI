//
//  NewItemView.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    let todoItem: ToDoListItem?
    
    init(todoItem: ToDoListItem? = nil, newItemPresented: Binding<Bool>) {
        self._newItemPresented = newItemPresented
        self.todoItem = todoItem
        
        if todoItem != nil {
            _viewModel = StateObject(
                wrappedValue: NewItemViewViewModel(
                    title: todoItem?.title ?? "",
                    dueDate: Date(
                        timeIntervalSince1970: todoItem?.dueDate ?? Date().timeIntervalSince1970
                    )
                )
            )
        }
    }
    
    var body: some View {
        VStack {
            Text("New item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: todoItem == nil ? "Save" : "Edit", background: .pink) {
                    if viewModel.canSave {
                        
                        if todoItem == nil {
                            viewModel.save()
                        } else {
                            viewModel.edit(newId: todoItem?.id ?? UUID().uuidString)
                        }
                        
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert("Error", isPresented: $viewModel.showAlert, actions: {
                return Button("OK", role: .cancel) { }
            }, message: {
                return Text("Please fill in all fields and select due date that is today or newer")
            })
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(todoItem: ToDoListItem(id: "123", title: "Realizar", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false), newItemPresented: Binding(get: {
            return true
        }, set: {_ in
            
        }))
    }
}
