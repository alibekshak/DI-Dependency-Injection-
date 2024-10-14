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
    
    var body: some View {
        VStack(spacing: .zero) {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.companyInfo, id: \.id) { info in
                      InfoCard(info: info)
                    }
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
