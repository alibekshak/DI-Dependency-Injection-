//
//  CoordinatorManager.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import Foundation
import SwiftUI

class CoordinatorManager: ObservableObject {

    var viewStack: [AnyView] = []
    
    static let shared = CoordinatorManager()
    
    @Published var appCoordinator: AppCoordinator
    @Published var homeCoordinator: HomeCoordinator
    @Published var productsCoordinator: ProductsCoordinator
    @Published var imagesCoordinator: ImagesCoordinator
    
    private init() {
        guard let appCoordinator = DependencyManager.shared.resolve(AppCoordinator.self),
              let homeCoordinator = DependencyManager.shared.resolve(HomeCoordinator.self),
              let productsCoordinator = DependencyManager.shared.resolve(ProductsCoordinator.self),
              let imagesCoordinator = DependencyManager.shared.resolve(ImagesCoordinator.self) else {
            fatalError("Failed to resolve one or more coordinators.")
        }
        
        self.appCoordinator = appCoordinator
        self.homeCoordinator = homeCoordinator
        self.productsCoordinator = productsCoordinator
        self.imagesCoordinator = imagesCoordinator
    }
}
