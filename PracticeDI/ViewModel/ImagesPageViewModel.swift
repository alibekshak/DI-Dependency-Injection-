//
//  ImagesPageViewModel.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 20.12.2024.
//

import Foundation

class ImagesPageViewModel: ObservableObject {
    
    @Published var imageData: [ImageData] = []
    @Published var isLoading: Bool = false
    
    private var networkManager: NetworkManager?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getImageData() {
        guard let networkManager = networkManager else {
            print("Network manager not available")
            return
        }
        
        isLoading = true
        
        networkManager.getImages(quantity: 10) {  result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    print("Success: \(response)")
                    self.imageData = response.data
                case .failure(let failure):
                    print("Error: \(failure)")
                }
            }
        }
    }
}
