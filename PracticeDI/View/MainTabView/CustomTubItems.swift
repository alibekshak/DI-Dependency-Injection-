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
                .foregroundColor(Color(.systemBrown))
            tabItems
        }
        .padding(.bottom)
    }
    
    var tabItems: some View {
        HStack(spacing: 64) {
            ForEach(EnumTabItem.allCases) { tabItem in
                Button {
                    selectedTabItem = tabItem
                } label: {
                    VStack(spacing: 24) {
                        Capsule()
                            .frame(width: 72, height: 1)
                        Image(systemName: tabItem.image)
                    }
                    .foregroundColor(
                        tabItem == selectedTabItem ?
                        Color(.systemBlue) :
                            Color(.systemGreen)
                    )
                }
            }
        }
    }
}

#Preview {
    CustomTubItems(selectedTabItem: .constant(.home))
}
