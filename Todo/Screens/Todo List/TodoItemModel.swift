//
//  TodoItemModel.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import Foundation

struct TodoItemModel: Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
