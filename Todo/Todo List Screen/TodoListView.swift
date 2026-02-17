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
        
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { $item in
                    TodoItemRow(item: $item.onValueChange {
                        viewModel.sortItems()
                    })
                    .listRowInsets(EdgeInsets())
//                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                }
                .onDelete { indexSet in
                    viewModel.deleteItems(at: indexSet)
                    print(viewModel.todoItems)
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItem(from:to:))
            }
            .navigationTitle("Today's Tasks")
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

#Preview {
    TodoListView()
}
