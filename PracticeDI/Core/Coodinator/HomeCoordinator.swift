//
//  HomeCoordinator.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import Foundation
import SwiftUI

class HomeCoordinator: CoordinatorProtocol {
    @Published var viewStack: [AnyView] = []
    
    init() {
        navigateToMainConten()
    }
    
    func navigateToMainConten() {
        self.viewStack.removeAll()
        navigate(to: MainContentView())
    }
    
    func navigateToInfoAddresses(info: UserData) {
        navigate(to: InfoAddressesView(info: info))
    }
    
    func navigate<T: View>(to view: T) {
        DispatchQueue.main.async {
            self.viewStack.append(AnyView(view))
        }
    }
    
    func navigateBack() {
        if viewStack.count > 1 {
            withAnimation(.easeOut) {
                viewStack.removeLast()
            }
        }
    }
}
