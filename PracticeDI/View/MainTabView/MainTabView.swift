//
//  MainTabView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTabItem: EnumTabItem

    @EnvironmentObject var coordinatorManager: CoordinatorManager
    
    var body: some View {
        VStack(spacing: .zero) {
            switch selectedTabItem {
            case .home:
                TabViewWithCoordinator(coordinator: coordinatorManager.homeCoordinator)
            case .user:
                TabViewWithCoordinator(coordinator: coordinatorManager.productsCoordinator)
            case .images:
                TabViewWithCoordinator(coordinator: coordinatorManager.imagesCoordinator)
            }
            CustomTubItems(selectedTabItem: $selectedTabItem)
        }
        .background(Color(.systemGray6))
    }
}
