//
//  ImagesPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 20.12.2024.
//

import SwiftUI
import Kingfisher

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
            if viewModel.isLoading {
                loadingView
            } else {
                imageInfo
            }
        }
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .onAppear {
            viewModel.getImageData()
        }
    }
    
    var imageInfo: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.imageData, id: \.self) { imageInfo in
                VStack(spacing: 8) {
                    Text(imageInfo.title)
                        .font(.title)
                    KFImage(URL(string: imageInfo.url))
                        .placeholder {
                           ProgressView()
                        }
                        .cacheOriginalImage()
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text(imageInfo.description)
                        .font(.callout)
                }
                .padding(.vertical, 6)
            }
        }
    }
    
    var loadingView: some View {
        VStack {
            ProgressView()
                .foregroundStyle(Color(uiColor: .label))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    ImagesPage()
}
