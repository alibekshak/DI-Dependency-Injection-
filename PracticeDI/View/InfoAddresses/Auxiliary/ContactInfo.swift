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
            VStack(alignment: .center, spacing: 12) {
                Text("\(contact.firstname ?? "") \(contact.lastname ?? "")")
                    .font(.system(size: 20, weight: .semibold))
                HStack(alignment: .center) {
                    HStack(spacing: 2) {
                        Text("Contact Info")
                        Image(systemName: "info.circle")
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 6) {
                        Text(contact.email ?? "")
                        Text(contact.phone ?? "")
                    }
                }
                .padding(.horizontal, 12)
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Working time")
                    Spacer()
                    Text("9.00 AM : 5.00 PM")
                }
                .padding(.horizontal, 12)
            }
            Spacer()
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 12)
    }
    
    var navigationBar: some View {
        HStack {
            Text("The company's representative")
        }
        .font(.system(size: 20, weight: .bold ,design: .rounded))
        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        .padding(.bottom, 20)
        .padding(.top)
    }
}

