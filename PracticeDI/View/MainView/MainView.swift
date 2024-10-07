//
//  MainView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        NavigationStack {
            VStack {
                if !appCoordinator.viewStack.isEmpty {
                    ForEach(appCoordinator.viewStack.indices, id: \.self) { index in
                        appCoordinator.viewStack[index]
                    }
                } else {
                    Text("No view available")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
