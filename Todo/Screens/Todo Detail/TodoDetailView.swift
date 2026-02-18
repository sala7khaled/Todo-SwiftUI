//
//  TodoDetailView.swift
//  Todo
//
//  Created by Salah Khaled on 18/02/2026.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var item: TodoItemModel
    
    var body: some View {
        
        Form {
            TextField("Title", text: $item.title)
                .font(.headline)
                .padding(EdgeInsets(top: 2, leading: 5, bottom: 0, trailing: 5))
            
            ZStack(alignment: .topLeading) {
                if (item.description ?? "").isEmpty {
                    Text("Description")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 9, leading: 8, bottom: 0, trailing: 0))
                }
                
                TextEditor(text: $item.description.onEmpty(""))
                    .font(.subheadline)
                    .frame(minHeight: 100)
            }
        }
    }
}

#Preview {
    let item = TodoItemModel(id: UUID(), title: "title")
    TodoDetailView(item: .constant(item))
}
