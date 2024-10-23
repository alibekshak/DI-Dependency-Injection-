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
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                image
                companyInfo
            }
            Text( info.email ?? "")
                .font(.system(size: 12, weight: .semibold))
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
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
            Text( info.name ?? "")
                .multilineTextAlignment(.leading)
                .font(.system(size: 14, weight: .bold))
            Text(info.phone ?? "")
            Text(info.country ?? "")
            websiteButton(info: info)
        }
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(Color(.black))
    }
    
    func websiteButton(info: UserData) -> some View {
        Button {
            if let website = info.website, let url = URL(string: website) {
                 UIApplication.shared.open(url)
             } else {
                 print("Некорректный URL")
             }
        } label: {
            Text("Website - \(info.website ?? "No website")")
                .underline()
                .font(.system(size: 14, weight: .medium))
                .padding(.vertical, 8)
                .contentShape(Rectangle())
        }
    }
}

