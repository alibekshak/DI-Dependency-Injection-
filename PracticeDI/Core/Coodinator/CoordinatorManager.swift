//
//  CoordinatorManager.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import Foundation
import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    var viewStack: [AnyView] { get set }
}

class CoordinatorManager: CoordinatorProtocol {
    var viewStack: [AnyView] = []
    
    static let shared = CoordinatorManager()
    
    @Published var appCoordinator: AppCoordinator
    @Published var homeCoordinator: HomeCoordinator
    @Published var productsCoordinator: ProductsCoordinator
    
    private init() {
        guard let appCoordinator = DependencyManager.shared.resolve(AppCoordinator.self),
              let homeCoordinator = DependencyManager.shared.resolve(HomeCoordinator.self),
              let productsCoordinator = DependencyManager.shared.resolve(ProductsCoordinator.self) else {
            fatalError("Failed to resolve one or more coordinators.")
        }
        
        self.appCoordinator = appCoordinator
        self.homeCoordinator = homeCoordinator
        self.productsCoordinator = productsCoordinator
    }
}
