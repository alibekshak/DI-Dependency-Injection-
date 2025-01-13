//
//  SwipeBackModifier.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 19.11.2024.
//

import Foundation
import SwiftUI

struct SwipeBackModifier<Coordinator: CoordinatorProtocol>: ViewModifier {
    @EnvironmentObject var coordinator: Coordinator
    
    var threshold: CGFloat = 70
    @State private var dragOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .offset(x: dragOffset)
            .opacity(calculateOpacity(for: dragOffset))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.width > 0 {
                            dragOffset = value.translation.width
                        }
                    }
                    .onEnded { value in
                        if value.translation.width > threshold {
                            withAnimation(.easeInOut) {
                                dragOffset = UIScreen.main.bounds.width
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                coordinator.navigateBack()
                            }
                        } else {
                            withAnimation(.easeInOut) {
                                dragOffset = 0
                            }
                        }
                    }
            )
            .animation(.easeInOut, value: dragOffset)
    }
    
    private func calculateOpacity(for offset: CGFloat) -> Double {
        let maxWidth = UIScreen.main.bounds.width
        let progress = min(offset / maxWidth, 1.0)
        return 1.0 - pow(progress, 2.0)
    }
}
