//
//  MainContentViewModel .swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 13.10.2024.
//

import Foundation


class MainContentViewModel: ObservableObject {
    
    @Published var companyInfo: [UserData] = []
    @Published var isLoading: Bool = false
    
    private var networkManager: NetworkManager?
    private var coordinator: AppCoordinator?
    
    init(networkManager: NetworkManager, coordinator: AppCoordinator) {
        self.networkManager = networkManager
        self.coordinator = coordinator
    }
    
    func getCompanyInfo() {
        guard let networkManager = networkManager else {
            print("Network manager not available")
            return
        }
        
        isLoading = true
                
        networkManager.getCompanyInfo(quantity: 10) {  result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    print("Success: \(response)")
                    self.companyInfo = response.data
                case .failure(let error):
                    print("Error: \(error)")
                }
            }

        }
    }
}
