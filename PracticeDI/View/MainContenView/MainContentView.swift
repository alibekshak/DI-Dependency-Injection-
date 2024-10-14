//
//  MainContentView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 13.10.2024.
//

import SwiftUI

struct MainContentView: View {
    
    @StateObject var viewModel: MainContentViewModel = {
        if let viewModel = DependencyManager.shared.resolve(MainContentViewModel.self) {
            return viewModel
        } else {
            fatalError("MainContentViewModel could not be resolved.")
        }
    }()
    
    let colums = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        VStack(spacing: .zero) {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: colums, spacing: 12) {
                    ForEach(viewModel.companyInfo, id: \.id) { info in
                      InfoCard(info: info)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .onAppear {
            viewModel.getCompanyInfo()
        }
    }
    
}

#Preview {
    MainContentView()
}
