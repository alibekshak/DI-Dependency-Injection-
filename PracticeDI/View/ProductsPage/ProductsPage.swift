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
    
    @EnvironmentObject var coordinator: ProductsCoordinator
    
    let columns = Array(repeating: GridItem(.flexible(), alignment: .top), count: 2)
    
    var body: some View {
        VStack(spacing: .zero) {
            if viewModel.isLoading {
                loadingView
            } else {
                products
            }
        }
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .onAppear {
            viewModel.getProducts()
        }
    }
    
    var products: some View {
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.filteredProductInfo, id: \.self) { product in
                        ProductCard(info: product)
                            .onTapGesture {
                                withAnimation {
                                    coordinator.navigateToProductInfoPage(product: product)
                                }
                            }
                    }
                }
                .padding(.bottom)
                .padding(.top, 68)
            }
            
            SearchView(
                placeholder: "Search Product",
                searchText: $viewModel.searchText,
                searchActive: $viewModel.isActive
            )
        }
    }
    
    var loadingView: some View {
        VStack {
            ProgressView()
                .foregroundStyle(Color(uiColor: .label))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
