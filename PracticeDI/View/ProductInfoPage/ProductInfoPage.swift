//
//  ProductInfoPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 15.11.2024.
//

import SwiftUI

struct ProductInfoPage: View {
    
    @EnvironmentObject var coordinator: ProductsCoordinator
    
    @Environment(\.colorScheme) var colorScheme
    
    var product: Product
    
    var body: some View {
        VStack(spacing: .zero) {
            navigationBar
            info
            Spacer()
        }
        .padding(.horizontal, 12)
    }
    
    var info: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(product.name)
            Text(product.description)
            Text("Price: \(product.price)")
        }
        .font(.system(size: 18, weight: .medium))
        .foregroundStyle(Color(.label))
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
