//
//  TargetService.swift
//  PracticeDI
//
//  Created by Alibek Shakirov on 07.10.2024.
//

import Foundation
import Moya

enum TargetService {
    case getCompanyInfo(params: [String: Any])
    case getProducts(params: [String: Any])
    case getImages(params: [String: Any])
}

extension TargetService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://fakerapi.it/api/v2")!
    }
    
    var path: String {
        switch self {
        case .getCompanyInfo:
            return "/companies"
        case .getProducts:
            return "/products"
        case .getImages:
            return "/images"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCompanyInfo, .getProducts, .getImages:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCompanyInfo(let params), .getProducts(let params), .getImages(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
