//
//  ImageResponse.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 17.12.2024.
//

import Foundation

struct ImageResponse: Codable, Hashable {
    let status: String
    let code: Int
    let locale: String
    let seed: String?
    let total: Int
    let data: [ImageData]
}

struct ImageData: Codable, Hashable {
    let title: String
    let description: String
    let url: String
}
