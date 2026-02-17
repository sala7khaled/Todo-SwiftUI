//
//  TodoItemRow.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItemModel
    
    var body: some View {
        
        HStack {
            ToggleButton(state: $item.isDone)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                
                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
            }
            
            Spacer()
        }
        .padding()
        
    }
}
 
#Preview("Title & Desc", traits: .fixedLayout(width: 300, height: 70)) {
    @Previewable @State var item = TodoItemModel(id: UUID(),
                                                 title: "Buy some bread",
                                                 description: "Get a zero calorie one",
                                                 isDone: true)
    TodoItemRow(item: $item)
}

#Preview("Title Only", traits: .fixedLayout(width: 300, height: 70)) {
    @Previewable @State var item = TodoItemModel(id: UUID(),
                                                 title: "Buy some milk",
                                                 isDone: false)
    TodoItemRow(item: $item)
}
