//
//  Binding + Extension.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import SwiftUI

extension Binding {
    
    func onValueChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                handler()
            }
        )
    }
}
