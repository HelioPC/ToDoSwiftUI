//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Eliude Vemba on 19/09/23.
//

import SwiftUI
import FirebaseCore

@main
struct Todo_ListApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
