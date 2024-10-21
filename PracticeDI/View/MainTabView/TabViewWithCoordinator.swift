//
//  TabViewWithCoordinator.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import Foundation
import SwiftUI

struct TabViewWithCoordinator<Coordinator: CoordinatorProtocol>: View {
    @ObservedObject var coordinator: Coordinator

    var body: some View {
        NavigationStack {
            VStack {
                if let currentView = coordinator.viewStack.last {
                    currentView
                } else {
                    Text("No view available")
                }
            }
        }
    }
}
