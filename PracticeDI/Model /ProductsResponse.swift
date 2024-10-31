//
//  ProductsResponse.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 31.10.2024.
//

import Foundation

struct ProductsResponse: Codable {
    let status: String
    let code: Int
    let locale: String
    let seed: String?
    let total: Int
    let data: [Product]
}
