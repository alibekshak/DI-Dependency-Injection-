//
//  MainContentView .swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 13.10.2024.
//

import Foundation


class MainContentViewModel: ObservableObject {
    
    @Published var companyInfo: [UserData] = []
    
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
                
        networkManager.getCompanyInfo(quantity: 10) {  result in
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
