//
//  ProductsCoordinator.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 22.10.2024.
//

import Foundation
import SwiftUI

class ProductsCoordinator: CoordinatorProtocol {
    @Published var viewStack: [AnyView] = []
    
    init() {
        productsPage()
    }
    
    func productsPage() {
        navigate(to: ProductsPage())
    }
    
    func navigateToProductInfoPage() {
        navigate(to: ProductInfoPage())
    }
    
    func navigate<T: View>(to view: T) {
        DispatchQueue.main.async {
            self.viewStack.append(AnyView(view))
        }
    }
    
    func navigateBack() {
        if viewStack.count > 1 {
            viewStack.removeLast()
        }
    }
}
