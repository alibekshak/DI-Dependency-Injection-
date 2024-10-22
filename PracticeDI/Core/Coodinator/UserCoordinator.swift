//
//  UserCoordinator.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 22.10.2024.
//

import Foundation
import SwiftUI

class UserCoordinator: CoordinatorProtocol {
    @Published var viewStack: [AnyView] = []
    
    init() {
        userPage()
    }
    
    func userPage() {
        navigate(to: UserPage())
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
