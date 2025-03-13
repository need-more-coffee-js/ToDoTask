//
//  TodoItem.swift
//  ToDo
//
//  Created by Денис Ефименков on 13.03.2025.
//

import Foundation

// MARK: - TodoItem
struct TodoItem: Codable {
    let todos: [Todo]?
    let total, skip, limit: Int?
}

// MARK: - Todo
struct Todo: Codable {
    let id: Int?
    let todo: String?
    let completed: Bool?
    let userID: Int?

    enum CodingKeys: String, CodingKey {
        case id, todo, completed
        case userID
    }
}
