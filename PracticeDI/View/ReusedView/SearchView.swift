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
                .foregroundColor(.black)
                .textFieldStyle(.plain)
            }
            
            if searchText != "" {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark")
                }
            }
        }
        .onTapGesture {
            isFocused = true
        }
        .foregroundStyle(Color(uiColor: .black).opacity(0.8))
        .frame(maxWidth: .infinity)
        .font(.system(size: 16, weight: .regular))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color(uiColor: .white))
        )
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray4), lineWidth: 1)
        }
        .padding(.bottom, 1)
    }
}
