//
//  Contact.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import Foundation

struct Contact: Codable, Hashable {
    let id: Int
    let firstname: String?
    let lastname: String?
    let email: String?
    let phone: String?
    let birthday: String?
    let gender: String?
    let address: Address
    let website: String?
    let image: String?
}
