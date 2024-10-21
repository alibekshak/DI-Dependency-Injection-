//
//  EnumTabItem.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 21.10.2024.
//

import Foundation

enum EnumTabItem: String, CaseIterable, Identifiable {
    
    case home

    
    var id: String {
        rawValue
    }
    
    var image: String {
        switch self {
        case .home:
            return "house.fill"
        }
    }
}
