//
//  AboutView.swift
//  Todo
//
//  Created by Salah Khaled on 18/02/2026.
//

import SwiftUI

struct AboutView: View {
    
    @State var isMoreInfoPresented = false
    
    var body: some View {
        
        NavigationView {
            GeometryReader { context in
                VStack {
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Image("salah")
                            .resizable()
                            .scaledToFill()
                            .frame(width: context.size.width * 0.3,
                                   height: context.size.width * 0.3)
                            .clipShape(Circle())
                            .padding(.bottom, 20)
                        
                        Text("Salah Khaled")
                            .font(.headline)
                        Text("Senior iOS Developer")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        isMoreInfoPresented = true
                    } label: {
                        HStack {
                            Text("More Info")
                            Spacer().frame(width: 8)
                            Image(systemName: "chevron.right")
                        }
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .tint(.blue)
                    .padding(.bottom, 20)
                }
                .frame(
                    width: context.size.width * 0.9,
                    height: context.size.height * 0.9
                )
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                .position(
                    x: context.size.width / 2,
                    y: context.size.height / 2
                )
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $isMoreInfoPresented) {
            MoreInfoView()
                .presentationDetents([.fraction(0.25), .medium])
        }
    }
}

#Preview {
    AboutView()
}

