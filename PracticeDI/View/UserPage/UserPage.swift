//
//  UserPage.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 22.10.2024.
//

import SwiftUI

struct UserPage: View {
    var body: some View {
        VStack {
            Spacer()
            Text("This section is under construction.")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
            
            Image(systemName: "hammer")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Spacer()
        }
        .background(Color(.systemGray6))
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    UserPage()
}
