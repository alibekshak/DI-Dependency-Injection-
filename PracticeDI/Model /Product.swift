//
//  Product.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 31.10.2024.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let description: String
    let ean: String
    let upc: String
    let image: String
    let images: [ProductImage]
    let netPrice: Double
    let taxes: Int
    let price: Double
    let categories: [String]
    let tags: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case ean
        case upc
        case image
        case images
        case netPrice = "net_price"
        case taxes
        case price
        case categories
        case tags
    }
}
