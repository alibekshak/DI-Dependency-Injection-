//
//  InfoAddressesView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 15.10.2024.
//

import SwiftUI

struct InfoAddressesView: View {
    
    @EnvironmentObject var coordinator: HomeCoordinator
    
    var addresses: [Address]
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            navigationBar
            ForEach(addresses, id: \.self) { address in
                Text(address.streetName ?? "")
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 12)
    }
    
    var navigationBar: some View {
        HStack {
            Button {
                withAnimation(.easeOut) {
                    coordinator.navigateBack()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 16, weight: .bold ,design: .rounded))
            }
            Spacer()
        }
        .padding(.bottom, 20)
    }
}

