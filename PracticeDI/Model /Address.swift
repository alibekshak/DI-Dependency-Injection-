//
//  Address.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import Foundation

struct Address: Codable {
    let id: Int
    let street: String
    let streetName: String
    let buildingNumber: String
    let city: String
    let zipcode: String
    let country: String
    let countryCode: String
    let latitude: Double
    let longitude: Double
}
