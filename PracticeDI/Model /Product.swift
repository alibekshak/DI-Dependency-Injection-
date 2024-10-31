//
//  Product.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 31.10.2024.
//

import Foundation

struct Product: Codable, Hashable {
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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        ean = try container.decode(String.self, forKey: .ean)
        upc = try container.decode(String.self, forKey: .upc)
        image = try container.decode(String.self, forKey: .image)
        images = try container.decode([ProductImage].self, forKey: .images)
        netPrice = try container.decode(Double.self, forKey: .netPrice)
        taxes = try container.decode(Int.self, forKey: .taxes)
        price = try container.decode(Double.self, forKey: .price)
        
        let rawCategories = try container.decode([AnyCodable].self, forKey: .categories)
        categories = rawCategories.compactMap { element in
            if let string = element.value as? String {
                return string
            } else if let number = element.value as? NSNumber {
                return number.stringValue
            } else {
                return nil
            }
        }
        
        tags = try container.decode([String].self, forKey: .tags)
    }
}


struct AnyCodable: Codable {
    let value: Any

    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            value = int
        } else if let double = try? decoder.singleValueContainer().decode(Double.self) {
            value = double
        } else if let string = try? decoder.singleValueContainer().decode(String.self) {
            value = string
        } else {
            throw DecodingError.typeMismatch(AnyCodable.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unsupported type"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let int = value as? Int {
            try container.encode(int)
        } else if let double = value as? Double {
            try container.encode(double)
        } else if let string = value as? String {
            try container.encode(string)
        } else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unsupported type"))
        }
    }
}
