//
//  ProductsPageViewModel.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 31.10.2024.
//

import Foundation

class ProductsPageViewModel: ObservableObject {
    
    @Published var  products: [Product] = []
    
    private var networkManager: NetworkManager?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    
    func getProducts() {
        guard let networkManager = networkManager else {
            print("Network manager not available")
            return
        }
        
        networkManager.getProducts(quantity: 10) {  result in
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