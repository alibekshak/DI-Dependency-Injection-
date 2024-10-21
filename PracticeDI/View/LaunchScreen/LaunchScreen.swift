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
            Color.blue.blur(radius: 35)
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .animation(.easeInOut(duration: 1.5), value: isAnimating)
        }
        .ignoresSafeArea()
        .onAppear {
            self.isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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
