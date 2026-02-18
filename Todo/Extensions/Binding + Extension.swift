//
//  Binding + Extension.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import SwiftUI

extension Binding {
    
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                handler()
            }
        )
    }
    
    func onEmpty<Wrapped>(_ defaultValue: Wrapped) -> Binding<Wrapped> where Value == Wrapped? {
        Binding<Wrapped>(
            get: { wrappedValue ?? defaultValue },
            set: { wrappedValue = $0 }
        )
    }
}
