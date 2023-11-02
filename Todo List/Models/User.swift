//
//  User.swift
//  Todo List
//
//  Created by Eliude Vemba on 22/09/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
