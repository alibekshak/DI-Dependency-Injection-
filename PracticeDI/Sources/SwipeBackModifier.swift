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

    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width > threshold {
                            coordinator.navigateBack()
                        }
                    }
            )
    }
}
