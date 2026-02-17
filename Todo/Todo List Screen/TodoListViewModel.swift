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
            fatalError("\(error)")
        }
    }
    
    func sortItems() {
        todoItems.sort { !$0.isDone && $1.isDone }
    }
    
    func deleteItems(at indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(from indexSet: IndexSet, to newIndex: Int) {
        todoItems.move(fromOffsets: indexSet, toOffset: newIndex)
    }
    
}
