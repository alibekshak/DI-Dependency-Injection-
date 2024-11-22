//
//  CustomTubItems.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import SwiftUI

struct CustomTubItems: View {
    
    @Binding var selectedTabItem: EnumTabItem
    
    var body: some View {
        ZStack(alignment: .top) {
            Capsule()
                .frame(height: 1)
                .foregroundColor(Color(.systemGray))
            tabItems
        }
        .padding(.bottom)
        .background(Color(.systemGray6))
    }
    
    var tabItems: some View {
        HStack(spacing: 64) {
            ForEach(EnumTabItem.allCases) { tabItem in
                VStack(spacing: 24) {
                    Capsule()
                        .frame(width: 72, height: 1)
                    Image(systemName: tabItem.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .foregroundColor(
                    tabItem == selectedTabItem ?
                    Color(.systemBlue) :
                        Color(.systemGray)
                )
                .onTapGesture {
                    selectedTabItem = tabItem
                }
            }
        }
    }
}

#Preview {
    CustomTubItems(selectedTabItem: .constant(.home))
}
