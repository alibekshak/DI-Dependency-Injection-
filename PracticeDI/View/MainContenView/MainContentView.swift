//
//  MainContentView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 13.10.2024.
//

import SwiftUI

struct MainContentView: View {
    
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @StateObject var viewModel: MainContentViewModel = {
        if let viewModel = DependencyManager.shared.resolve(MainContentViewModel.self) {
            return viewModel
        } else {
            fatalError("MainContentViewModel could not be resolved.")
        }
    }()
    
    let colums = Array(repeating: GridItem(.flexible(), spacing: .zero, alignment: .top), count: 1)
    
    var body: some View {
        VStack(spacing: .zero) {
            if viewModel.isLoading {
                loadingView
            } else {
                infoCard
            }
        }
        .padding(.horizontal, 12)
        .onAppear {
            viewModel.getCompanyInfo()
        }
        .background(Color(.systemGray6))
    }
    
    var loadingView: some View {
        VStack {
            ProgressView()
                .foregroundStyle(Color(uiColor: .label))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    var infoCard: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: colums, alignment: .center, spacing: 8) {
                ForEach(viewModel.companyInfo, id: \.id) { info in
                    InfoCard(info: info)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.5)) {
                                coordinator.navigateToInfoAddresses(addresses: info.addresses)
                            }
                        }
                }
            }
        }
    }
}
