//
//  SearchView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 23.10.2024.
//

import SwiftUI

struct SearchView: View {
    
    let placeholder: String
    
    @Binding var searchText: String
    @Binding var searchActive: Bool
    @FocusState var isFocused:Bool
    
    var body: some View {
        Group {
            HStack(spacing: 12) {
                HStack {
                    Image(systemName: "magnifyingglass")

                    // Search text field
                    ZStack (alignment: .leading) {
                        if searchText.isEmpty {
                            Text(placeholder)
                                .lineLimit(1)
                        }
                        TextField("", text: $searchText, onEditingChanged: { isEditing in
                            withAnimation(.snappy) {
                                self.searchActive = true
                            }
                        })
                        .focused($isFocused)
                        .foregroundColor(.primary)
                        .textFieldStyle(.plain)
                    }
                    
                    if searchText != "" {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                    }
                }
                .onTapGesture {
                    isFocused = true
                }
                .foregroundStyle(Color(uiColor: .tertiaryLabel))
                .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .regular))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
            }
        }
    }
}
