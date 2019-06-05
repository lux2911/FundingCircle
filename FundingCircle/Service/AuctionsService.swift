//
//  AuctionsService.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/3/19.
//  Copyright © 2019 lux. All rights reserved.
//

import Foundation
import Alamofire

typealias AuctionsCompletionBlock = (Result<[Auction]>) -> Void

protocol AuctionsServiceProtocol {
   func getAuctions(_ completion: @escaping AuctionsCompletionBlock)
}

class AuctionsService : AuctionsServiceProtocol {
    
    static let shared: AuctionsServiceProtocol = NSClassFromString("XCTest") == nil ? AuctionsService() : MockAuctionsService()
    
    private init(){ }
    
    func getAuctions(_ completion: @escaping AuctionsCompletionBlock){
        Alamofire.request(AuctionsRouter.auctions)
            .response { response in
                guard let data = response.data, response.error == nil else {
                    completion(Result<[Auction]>.failure(response.error!))
                    return
                }
                
                let auctionData = try! JSONDecoder().decode(AuctionData.self, from: data)
                completion(Result<[Auction]>.success(auctionData.items))
                
        }
    }
}
// Instance of this class will be instantiated when executing unit tests
class MockAuctionsService : AuctionsServiceProtocol {
    func getAuctions(_ completion: @escaping AuctionsCompletionBlock){
        let data = try! Data.init(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Auctions", ofType: "json")!))
        
        let auctionData = try! JSONDecoder().decode(AuctionData.self, from: data)
        completion(Result<[Auction]>.success(auctionData.items))
        
    }
}
