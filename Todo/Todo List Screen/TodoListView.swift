//
//  ContentView.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        
        List($viewModel.todoItems) { $item in
            TodoItemRow(item: $item.onValueChange {
                viewModel.sortItems()
            })
        }.onAppear {
            viewModel.loadItems()
        }
    }
}

#Preview {
    TodoListView()
}
