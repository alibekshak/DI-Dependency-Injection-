//
//  ProductsPageViewModel.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 31.10.2024.
//

import Foundation

class ProductsPageViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var searchText = ""
    @Published var isActive = false
    
    private var networkManager: NetworkManager?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    var filteredProductInfo: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { product in
                product.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    func getProducts() {
        guard let networkManager = networkManager else {
            print("Network manager not available")
            return
        }
        
        isLoading = true
        
        networkManager.getProducts(quantity: 10) {  result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    self.products = response.data
                    print("\n Products: \(response.data)")
                case .failure(let error):
                    print("Error on getProducts: \(error)")
                }
            }
        }
    }
}
