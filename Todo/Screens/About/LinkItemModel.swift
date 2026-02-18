//
//  LinkItemModel.swift
//  Todo
//
//  Created by Salah Khaled on 18/02/2026.
//

import Foundation

struct LinkItemModel: Identifiable {

    let id = UUID()
    let title: String
    let icon: String
    let url: String
}
