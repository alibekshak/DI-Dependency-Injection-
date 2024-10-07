//
//  UserData.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import Foundation

struct UserData: Codable {
    let id: Int
    let name: String
    let email: String
    let vat: String
    let phone: String
    let country: String
    let addresses: [Address]
    let website: String
    let image: String
    let contact: Contact
}

