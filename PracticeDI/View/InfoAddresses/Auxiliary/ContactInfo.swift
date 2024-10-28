//
//  ContactInfo.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 28.10.2024.
//

import SwiftUI

struct ContactInfo: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var contact: Contact
    
    var body: some View {
        VStack(spacing: .zero) {
            navigationBar
            Text("\(contact.firstname ?? "") \(contact.lastname ?? "")")
        }
        .padding(.horizontal, 12)
    }
    
    var navigationBar: some View {
        HStack {
            Text("The company's representative")
        }
        .font(.system(size: 20, weight: .bold ,design: .rounded))
        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        .padding(.bottom, 20)
    }
}

