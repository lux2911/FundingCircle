//
//  AuctionsViewModel.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/3/19.
//  Copyright © 2019 lux. All rights reserved.
//

import Foundation

class AuctionsViewModel {
    
    private (set) var auctions = [Auction]() {
        didSet {
            reloadData?()
        }
    }
    
    var reloadData: (()->Void)?
    var displayError: ((Error)->Void)?
    
    func getAuctions() {
        AuctionsService.shared.getAuctions { [weak self] result in
            
            if result.isSuccess {
                self?.auctions = result.value!
            } else {
                self?.displayError?(result.error!)
            }
        }
    }
}
