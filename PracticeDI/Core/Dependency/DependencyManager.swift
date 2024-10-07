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
        
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }
}
