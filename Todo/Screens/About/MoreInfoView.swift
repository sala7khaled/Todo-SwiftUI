//
//  MoreInfoView.swift
//  Todo
//
//  Created by Salah Khaled on 18/02/2026.
//

import SwiftUI

struct MoreInfoView: View {
    
    @StateObject var viewModel = AboutViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 12) {
                ForEach(viewModel.linkItems, id: \.id) { item in
                    Button {
                        openURL(item.url)
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: item.icon)
                            Text(item.title)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(.gray)
                }
            }
            .navigationTitle("More Info")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.gray.opacity(0.05), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            .onAppear {
                viewModel.loadLinks()
            }
        }
    }
    
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}

#Preview {
    MoreInfoView()
}
