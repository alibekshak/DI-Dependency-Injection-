//
//  ContentView.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            let networkManager = NetworkManager()
            networkManager.getCompanyInfo(quantity: 10) {  result in
                switch result {
                case .success(let response):
                    print("Success: \(response)")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
