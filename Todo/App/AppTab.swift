//
//  AppTab.swift
//  Todo
//
//  Created by Salah Khaled on 18/02/2026.
//

import SwiftUI

enum AppTab: Hashable, CaseIterable {
    
    case todoList
    case about
    
    var icon: String {
        switch self {
        case .todoList: "checkmark.circle"
        case .about: "info.circle"
        }
    }
    
    var title: String {
        switch self {
        case .todoList: "Todo List"
        case .about: "About"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .todoList: TodoListView()
        case .about: AboutView()
        }
    }
}
