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
        VStack(alignment: .center, spacing: .zero) {
            image
            VStack(alignment: .leading, spacing: 6) {
                Text(info.name)
                Text(info.description)
                    .font(.system(size: 12, weight: .regular))
                    .lineLimit(4)
            }
        }
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(Color(.black))
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
        )
    }
    
    var image: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 128, height: 128)
            .padding(8)
            .foregroundStyle(Color(.systemGray))
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray5))
            }
            .padding(.bottom, 12)
    }
}

