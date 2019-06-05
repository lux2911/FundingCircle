//
//  EstimatedReturnViewModel.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/4/19.
//  Copyright © 2019 lux. All rights reserved.
//

import Foundation

class EstimatedReturnViewModel {
    
    var auction: EstimatedReturnAmountCellData!
    
    func getERA(forBid bid:Int)-> Double {
       return (1.00 + auction.rate + auction.riskBand.riskbandValue.rawValue - Auction.fee) * Double(bid)
    }
}
