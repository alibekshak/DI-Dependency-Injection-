//
//  InfoAddressesView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 15.10.2024.
//

import SwiftUI

struct InfoAddressesView: View {
    
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @Environment(\.colorScheme) var colorScheme
    
    var info: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            navigationBar
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(info.addresses, id: \.self) { address in
                        addressCard(address: address)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 12)
        .enableSwipeBack(coordinator: HomeCoordinator.self)
    }
    
    func addressCard(address: Address) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Address - \(address.streetName ?? ""), \(address.buildingNumber ?? "")")
                .font(.system(size: 18, weight: .semibold))
            Text("Country - \(address.country ?? ""), \(address.city ?? "")")
            Text("ZIP codes - \(address.zipcode ?? "")")
        }
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(Color(.black))
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(.systemGray4), lineWidth: 1)
        }
    }
    
    var navigationBar: some View {
        HStack {
            Button {
                withAnimation(.easeOut) {
                    coordinator.navigateBack()
                }
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Spacer()
            Text("International offices")
                .font(.system(size: 18, weight: .bold))
                .padding(.trailing)
            Spacer()
            
            Button {
                withAnimation {
                    coordinator.navigateToContactInfo(contact: info.contact)
                }
            } label: {
                Image(systemName: "questionmark")
            }
        }
        .font(.system(size: 20, weight: .bold ,design: .rounded))
        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        .padding(.bottom, 20)
    }
}

