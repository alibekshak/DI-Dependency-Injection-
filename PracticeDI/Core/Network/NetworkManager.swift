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
    
    func getCompanyInfo(quantity: Int, completion: @escaping (Result<ResponseCompanies, MoyaError>) -> Void) {
        let params: [String: Any] = [
            "_quantity": quantity
        ]
        
        provider.request(.getCompanyInfo(params: params)) { result in
            switch result {
            case let .success(response):
                do {
                    let companies = try JSONDecoder().decode(ResponseCompanies.self, from: response.data)
                    completion(.success(companies))
                } catch let decodingError {
                    let moyaError = MoyaError.underlying(decodingError, response)
                    completion(.failure(moyaError))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func getProducts(quantity: Int, completion: @escaping (Result<ProductsResponse, MoyaError>) -> Void) {
        let params: [String: Any] = [
            "_quantity": quantity
        ]
        
        provider.request(.getProducts(params: params)) { result in
            switch result {
            case let .success(response):
                do {
                    let products = try JSONDecoder().decode(ProductsResponse.self, from: response.data)
                    completion(.success(products))
                } catch let decodingError {
                    let moyaError = MoyaError.underlying(decodingError, response)
                    completion(.failure(moyaError))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
