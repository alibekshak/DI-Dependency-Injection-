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
        
        container.register(MainContentViewModel.self) { resolver in
            guard let networkManager = resolver.resolve(NetworkManager.self),
                  let coordinator = resolver.resolve(AppCoordinator.self) else {
                fatalError("Unable to resolve dependencies for MainContentViewModel")
            }
            return MainContentViewModel(networkManager: networkManager, coordinator: coordinator)
        }
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }
}
