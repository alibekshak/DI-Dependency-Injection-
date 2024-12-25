//
//  ImagesCoordinator.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 17.12.2024.
//

import Foundation
import SwiftUI

class ImagesCoordinator: CoordinatorProtocol {
    @Published var viewStack: [AnyView] = []
    
    init() {
        navigateToImagesPage()
    }
    
    func navigateToImagesPage() {
        navigate(to: ImagesPage())
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
