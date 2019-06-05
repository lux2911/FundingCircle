//
//  AuctionsRouting.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/3/19.
//  Copyright © 2019 lux. All rights reserved.
//

import Foundation
import Alamofire

enum AuctionsRouter: URLRequestConvertible {
    
    static let baseURLPath = "http://fc-ios-test.herokuapp.com"
    
    case auctions
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .auctions:
            return "/auctions"
           
        }
    }
    
    var parameters: [String: Any] {
        switch self {
          default:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try AuctionsRouter.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
      
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
