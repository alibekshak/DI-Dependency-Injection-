//
//  ProductInfoPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 15.11.2024.
//

import SwiftUI

struct ProductInfoPage: View {
    
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: .zero) {
            navigationBar
         
            Image(systemName: "hammer.fill")
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .padding(.horizontal, 12)
    }
    
    var navigationBar: some View {
        HStack {
            Button {
                withAnimation(.easeOut) {
                    coordinator.navigateBack()
                }
            } label: {
                Image(systemName: "chevron.left")
            }
            Spacer()
        }
        .font(.system(size: 20, weight: .bold ,design: .rounded))
        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        .padding(.bottom, 20)
    }
}

#Preview {
    ProductInfoPage()
}
