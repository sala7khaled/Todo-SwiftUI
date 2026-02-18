//
//  AboutViewModel.swift
//  Todo
//
//  Created by Salah Khaled on 18/02/2026.
//

import Foundation

class AboutViewModel: ObservableObject{
    
    @Published var linkItems: [LinkItemModel] = []
    
    func loadLinks() {
        guard linkItems.isEmpty else { return }
        
        linkItems = [
            LinkItemModel(title: "Linktree", icon: "network", url: "http://linktr.ee/sala7khaled"),
            LinkItemModel(title: "LinkedIn", icon: "person.circle", url: "http://linkedin.com/in/sala7khaled"),
            LinkItemModel(title: "GitHub", icon: "link", url: "http://github.com/sala7khaled")
            
        ]
    }

}
