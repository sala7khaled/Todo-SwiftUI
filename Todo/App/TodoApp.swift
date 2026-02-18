//
//  TodoApp.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @State var selectedTab: AppTab = .todoList
    
    var body: some Scene {
        
        WindowGroup {
            TabView(selection: $selectedTab) {
                ForEach(AppTab.allCases, id: \.self) { tab in
                    tab.view
                        .tabItem {
                            Image(systemName: tab.icon)
                            Text(tab.title)
                        }
                        .tag(tab)
                }
            }
        }
    }
}
