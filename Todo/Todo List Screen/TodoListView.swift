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
        
        List {
            ForEach($viewModel.todoItems) { $item in
                TodoItemRow(item: $item.onValueChange {
                    viewModel.sortItems()
                })
            }
            .onDelete { indexSet in
                viewModel.deleteItems(at: indexSet)
                print(viewModel.todoItems)
            }
            .onDelete(perform: viewModel.deleteItems(at:))
        }
        .onAppear {
            viewModel.loadItems()
        }
    }
}

#Preview {
    TodoListView()
}
