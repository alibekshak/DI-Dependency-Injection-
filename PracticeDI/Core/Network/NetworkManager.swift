//
//  NetworkManager.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 11.10.2024.
//

import Foundation
import Moya

class NetworkManager {
    private let provider: MoyaProvider<TargetService>
    
    init(provider: MoyaProvider<TargetService> = MoyaProvider<TargetService>()) {
        self.provider = provider
    }
    
}
