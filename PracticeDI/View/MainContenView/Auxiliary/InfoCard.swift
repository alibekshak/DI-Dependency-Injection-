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
        VStack(alignment: .center, spacing: 8) {
            image
            companyInfo
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .frame(maxWidth: 160, alignment: .center)
        .background(Color.white)
        .cornerRadius(16)
        .foregroundColor(.black)
        //        .shadow(radius: 4)
    }
    
    var image: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 128, maxHeight: 129)
            .foregroundColor(.gray)
    }
    
    var companyInfo: some View {
        Group {
            Text( info.name ?? "")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(2)
            Text( info.country ?? "")
        }
        .lineLimit(1)
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(Color(.systemGray2))
    }
}

