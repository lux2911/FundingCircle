//
//  AuctionCell.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/3/19.
//  Copyright © 2019 lux. All rights reserved.
//

import UIKit

class AuctionCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblTerm: UILabel!
    @IBOutlet weak var lblCloseTime: UILabel!
    
   

    func configure(with data: AuctionCellData) {
        lblTitle.text = data.title
        lblAmount.text = "\(data.amount_eur)"
        lblTerm.text = "\(data.term)"
        lblCloseTime.text = data.close_date
    }

}
