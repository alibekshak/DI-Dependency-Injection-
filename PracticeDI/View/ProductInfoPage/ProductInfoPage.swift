//
//  ProductInfoPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 15.11.2024.
//

import SwiftUI
import Kingfisher

struct ProductInfoPage: View {
    
    @EnvironmentObject var coordinator: ProductsCoordinator
    
    @Environment(\.colorScheme) var colorScheme
    
    var product: Product
    
    var body: some View {
        VStack(spacing: .zero) {
            navigationBar
            ScrollView(showsIndicators: false) {
                info
                products
            }
        }
        .padding(.horizontal, 12)
        .enableSwipeBack(coordinator: ProductsCoordinator.self)
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
    
    var products: some View {
        ForEach(product.images, id: \.self) { image in
            HStack {
                KFImage(URL(string: image.url))
                    .placeholder {
                       ProgressView()
                    }
                    .cacheOriginalImage()
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 150, maxHeight: 150)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(image.title)
                    Text(image.description)
                }
            }

            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
            }
        }
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

extension View {
    func enableSwipeBack<Coordinator: CoordinatorProtocol>(
        coordinator: Coordinator.Type
        
    ) -> some View {
        modifier(SwipeBackModifier<Coordinator>())
    }
}

