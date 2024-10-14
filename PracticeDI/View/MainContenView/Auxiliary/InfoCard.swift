//
//  InfoCard.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 14.10.2024.
//

import SwiftUI
import Kingfisher

struct InfoCard: View {
    
    var info: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            image
            companyInfo
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 12)
        .frame(width: 200, height: 300)
        .background(Color.white)
        .cornerRadius(16)
        .foregroundColor(.black)
    }
    
    var image: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 128, maxHeight: 129)
            .foregroundColor(.gray)
        
    }
    
    var companyInfo: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let companyName = info.name {
                Text(companyName)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16, weight: .semibold))
            } else {
                Text("No company name")
            }
            
            if let country = info.country {
                Text(country)
            } else {
                Text("No info country")
            }
        }
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(Color(.systemGray2))
        .padding(.horizontal)
    }
}

