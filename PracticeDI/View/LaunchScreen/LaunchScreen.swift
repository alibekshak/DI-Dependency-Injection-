//
//  LaunchScreen.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import SwiftUI

struct LaunchScreen: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var coordinatorManager: CoordinatorManager
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.blue.blur(radius: 34)
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .scaleEffect(isAnimating ? 0.8 : 1.1)
                .animation(.interactiveSpring(duration: 1), value: isAnimating)
        }
        .ignoresSafeArea()
        .onAppear {
            self.isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation {
                    appCoordinator.navigateToMainConten()
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
