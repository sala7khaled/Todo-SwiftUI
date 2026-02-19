//
//  ToggleButton.swift
//  Todo
//
//  Created by Salah Khaled on 17/02/2026.
//

import SwiftUI

struct ToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        
        Button {
            withAnimation {
                state.toggle()
            }
        } label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .foregroundStyle(state ?.blue : .gray.opacity(0.5))
                    
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.7)
                            .foregroundStyle(.blue)
                    }
                }
                
            }
            .padding(8)
        }
        .scaledToFit()
    }
}

#Preview("ON", traits: .fixedLayout(width: 40, height: 40)) {
    @Previewable @State var state = true
    ToggleButton(state: $state)
}

#Preview("OFF", traits: .fixedLayout(width: 40, height: 40)) {
    @Previewable @State var state = false
    ToggleButton(state: $state)
}
