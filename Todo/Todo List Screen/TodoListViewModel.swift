//
//  TodoListViewModel.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import Foundation

class TodoListViewModel: ObservableObject{
    
    @Published var todoItems: [TodoItemModel] = []
    
    func loadItems() {
        do {
            todoItems = try .fromJSON(named: "TodoItems")
        } catch {
            print(error)
        }
    }
    
}
