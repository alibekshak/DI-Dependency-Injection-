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
                .font(.title2)
            Text(product.description)
                .font(.system(size: 16, weight: .medium))
            HStack {
                Text("Price: \(String(format: "%.2f", product.price))")
                Spacer()
                Text("NetPrice: \(String(format: "%.2f", product.netPrice))")
            }
        }
        .font(.system(size: 18, weight: .medium))
        .foregroundStyle(Color(.label))
    }
    
    var products: some View {
        ForEach(product.images, id: \.self) { image in
            VStack(spacing: 8) {
                Text(image.title)
                    .font(.title3)
                
                HStack(alignment: .top) {
                    KFImage(URL(string: image.url))
                        .placeholder {
                           ProgressView()
                        }
                        .cacheOriginalImage()
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Spacer()
                    Text(image.description)
                        .font(.footnote)
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
            }
        }
        .padding(.bottom)
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
            Text("Info")
                .font(.system(size: 18, weight: .bold))
                .padding(.trailing)
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

