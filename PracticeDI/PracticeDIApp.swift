//
//  PracticeDIApp.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import SwiftUI

@main
struct PracticeDIApp: App {
    
    @State var isAppLoaded: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if let appCoordinator = DependencyManager.shared.resolve(AppCoordinator.self),
               let coordinatorManager = DependencyManager.shared.resolve(CoordinatorManager.self),
               let homeCoordinator = DependencyManager.shared.resolve(HomeCoordinator.self),
               let productsCoordinator = DependencyManager.shared.resolve(ProductsCoordinator.self),
               let imagesCoordinator = DependencyManager.shared.resolve(ImagesCoordinator.self) {
                MainView()
                    .environmentObject(appCoordinator)
                    .environmentObject(coordinatorManager)
                    .environmentObject(homeCoordinator)
                    .environmentObject(productsCoordinator)
                    .environmentObject(imagesCoordinator)
            } else {
                Text("Failed to resolve coordinator")
            }
        }
    }
}
