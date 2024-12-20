//
//  ImagesPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 20.12.2024.
//

import SwiftUI

struct ImagesPage: View {
    
    @StateObject var viewModel: ImagesPageViewModel = {
        if let viewModel = DependencyManager.shared.resolve(ImagesPageViewModel.self) {
            return viewModel
        } else {
            fatalError("ImagesPageViewModel could not be resolved.")
        }
    }()
    
    var body: some View {
        VStack(spacing: .zero) {
            ForEach(viewModel.imageData, id: \.self) { imageInfo in
                Text(imageInfo.title)
            }
        }
        .onAppear {
            viewModel.getImageData()
        }
    }
}

#Preview {
    ImagesPage()
}
