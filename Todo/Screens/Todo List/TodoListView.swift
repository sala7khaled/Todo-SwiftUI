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
        
        NavigationStack {
            List {
                ForEach($viewModel.todoItems) { $item in
                    NavigationLink(value: item) {
                        TodoItemRow(item: $item.onChange {
                            viewModel.sortItems()
                        })
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 14))
//                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 } // To remove divider's leading space
                }
                .onDelete { indexSet in
                    viewModel.deleteItems(at: indexSet)
                    print(viewModel.todoItems)
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItem(from:to:))
            }
            .navigationTitle("Today's Tasks")
            .navigationDestination(for: TodoItemModel.self, destination: { item in
                if let itemBidding = getItemBinding(from: item) {
                    TodoDetailView(item: itemBidding)
                }
            })
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear() {
                viewModel.loadItems()
            }
        }
    }
    
    func getItemBinding(from item: TodoItemModel) -> Binding<TodoItemModel>? {
        return $viewModel.todoItems.first(where: { $0.id == item.id })
    }

}

#Preview {
    TodoListView()
}
