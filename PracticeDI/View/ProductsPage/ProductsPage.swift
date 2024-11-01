//
//  ProductsPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 22.10.2024.
//

import SwiftUI

struct ProductsPage: View {
    
    @StateObject var viewModel: ProductsPageViewModel = {
        if let viewModel = DependencyManager.shared.resolve(ProductsPageViewModel.self) {
            return viewModel
        } else {
            fatalError("ProductsPageViewModel could not be resolved.")
        }
    }()
    
    var body: some View {
        VStack(spacing: .zero) {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.products, id: \.self) { product in
                    ProductCard(info: product)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .onAppear {
            viewModel.getProducts()
        }
    }
}
