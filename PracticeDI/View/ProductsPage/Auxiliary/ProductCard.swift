//
//  ProductCard.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 01.11.2024.
//

import SwiftUI

struct ProductCard: View {
    
    var info: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            image
            VStack(alignment: .leading, spacing: 6) {
                Text(info.name)
                Text(info.description)
                    .font(.system(size: 12, weight: .regular))
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(Color(.black))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(.white)
        )
    }
    
    var image: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 128, height: 128)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 32)
                    .fill(.gray)
            }
            .padding(.bottom, 12)
    }
}

