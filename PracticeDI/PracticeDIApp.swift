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
            if let appCoordinator = DependencyManager.shared.resolve(AppCoordinator.self) {
                MainView()
                    .environmentObject(appCoordinator)
            } else {
                Text("Failed to resolve coordinator")
            }
        }
    }
}
