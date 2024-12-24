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
    
    private weak var currentModalController: UIViewController?
    
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
    
    func navigateToContactInfo(contact: Contact) {
        presentModally(view:  ContactInfo(contact: contact))
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
    
    private func presentModally<T: View>(view: T) {
        let hostingController = UIHostingController(rootView: view.environmentObject(self))
        hostingController.modalPresentationStyle = .pageSheet
        
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                
                if let sheet = hostingController.sheetPresentationController {
                    sheet.detents = [.medium()]
                }
                
                rootViewController.present(hostingController, animated: true)
                self.currentModalController = hostingController
            }
        }
    }
    
    func dismissModally() {
        DispatchQueue.main.async {
            self.currentModalController?.dismiss(animated: true)
            self.currentModalController = nil
        }
    }
}
