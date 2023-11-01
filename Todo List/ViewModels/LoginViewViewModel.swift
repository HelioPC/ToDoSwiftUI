//
//  LoginViewViewModel.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields"
            print(errorMessage)
            return
        }
        
        guard !email.contains("@") && !email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return
        }
    }
    
    func validate() {
    }
}
