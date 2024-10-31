//
//  DependencyManager.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import Swinject

class DependencyManager {
    static let shared = DependencyManager()
    
    let container: Container
    
    private init() {
        container = Container()
        setupDependencies()
    }
    
    private func setupDependencies() {
        container.register(AppCoordinator.self) { _ in
            AppCoordinator()
        }.inObjectScope(.container)
        
        
        container.register(NetworkManager.self) { _ in
            NetworkManager()
        }.inObjectScope(.container)
        
        container.register(CoordinatorManager.self) { _ in
            CoordinatorManager.shared
        }.inObjectScope(.container)

        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator()
        }.inObjectScope(.container)
        
        container.register(ProductsCoordinator.self) { _ in
            ProductsCoordinator()
        }.inObjectScope(.container)
        
        container.register(MainContentViewModel.self) { resolver in
            guard let networkManager = resolver.resolve(NetworkManager.self),
                  let coordinator = resolver.resolve(AppCoordinator.self) else {
                fatalError("Unable to resolve dependencies for MainContentViewModel")
            }
            
            return MainContentViewModel(networkManager: networkManager, coordinator: coordinator)
        }
        
        container.register(ProductsPageViewModel.self) { resolver in
            guard let networkManager = resolver.resolve(NetworkManager.self) else {
                fatalError("Unable to resolve dependencies for MainContentViewModel")
            }
            
            return ProductsPageViewModel(networkManager: networkManager)
        }
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }
}
