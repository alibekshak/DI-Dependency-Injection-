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
                VStack {
                    ForEach(viewModel.companyInfo, id: \.id) { info in
                        Text(info.name ?? "")
                            .font(.title)
                        Text(info.email ?? "")
                            .font(.caption)
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
