//
//  ResponseCompanies .swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import Foundation


struct ResponseCompanies : Codable {
    let status: String
    let code: Int
    let locale: String
    let seed: String?
    let total: Int
    let data: [UserData]
}

