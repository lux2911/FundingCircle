//
//  Auction.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/3/19.
//  Copyright © 2019 lux. All rights reserved.
//

import Foundation

struct AuctionData: Codable {
    let items: [Auction]
}

struct Auction : Codable {
    let id: Int
    let title: String
    let rate: Double
    let amount_cents: Int
    let term: Int
    let risk_band: String
    let close_time: String
   
}

enum RiskBandValue : Double {
    
    case A_plus = 0.01
    case A = 0.02
    case B = 0.03
    case C = 0.04
    case C_minus = 0.05
}

enum RiskBand : String {
    case A_plus = "A+"
    case A = "A"
    case B = "B"
    case C = "C"
    case C_minus = "C-"
    
    var riskbandValue : RiskBandValue {
        switch self {
        case .A:
            return RiskBandValue.A
        case .A_plus:
            return RiskBandValue.A_plus
        case .B:
            return RiskBandValue.B
        case .C:
            return RiskBandValue.C
        case .C_minus:
            return RiskBandValue.C_minus
       
        }
    }
}

extension Auction {
    var close_date: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            let date = formatter.date(from: close_time)!
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter.string(from: date)
        }
    }
    
    var amount_eur: Double {
        get {
            return Double(amount_cents / 1000)
        }
    }
    
    var riskBand : RiskBand {
        get {
            return RiskBand(rawValue: risk_band)!
        }
    }
    
    static let fee = 0.01
}

protocol AuctionCellData {
    var title: String {get}
    var amount_eur: Double {get}
    var term: Int {get}
    var close_date: String {get}
}

protocol EstimatedReturnAmountCellData {
    var title: String {get}
    var rate: Double {get}
    var riskBand : RiskBand {get}
    
}

extension Auction: AuctionCellData {}
extension Auction: EstimatedReturnAmountCellData {}
