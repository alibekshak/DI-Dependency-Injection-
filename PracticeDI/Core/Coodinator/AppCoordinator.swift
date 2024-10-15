//
//  AppCoordinator.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import SwiftUI


class AppCoordinator: ObservableObject {
    @Published var viewStack: [AnyView] = []
    
    init() {
        naviageToLaunchScreen()
    }
    
    func navigateToMainConten() {
        self.viewStack.removeAll()
        navigate(to: MainContentView())
    }
    
    func navigateToInfoAddresses(addresses: [Address]) {
        navigate(to: InfoAddressesView(addresses: addresses))
    }
    
    func naviageToLaunchScreen() {
        navigate(to: LaunchScreen())
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
