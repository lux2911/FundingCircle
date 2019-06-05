//
//  EstimatedReturnViewController.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/4/19.
//  Copyright © 2019 lux. All rights reserved.
//

import UIKit

class EstimatedReturnViewController: UITableViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFieldBid: UITextField!
    @IBOutlet weak var lblERA: UILabel!
    
    static let defaultBidAmount = 20
    var currentBidAmount : Int!
    
    lazy var viewModel: EstimatedReturnViewModel = {
        return EstimatedReturnViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentBidAmount = EstimatedReturnViewController.defaultBidAmount
        initView()
        bindData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtFieldBid.becomeFirstResponder()
    }
    
    
    
    
    @IBAction func textFieldEditingDidChange(_ sender: UITextField) {
        currentBidAmount = Int(sender.text!) ?? 0
        recalculateERA()
    }
    
    
// MARK: - Privates
    private func initView() {
        tableView.tableFooterView = UIView()
        tableView.bounces = false
        
        lblERA.layer.cornerRadius = 8.0
        lblERA.layer.masksToBounds = true
        
    }
    
    private func bindData() {
        lblTitle.text = viewModel.auction?.title
        txtFieldBid.text = "\(currentBidAmount!)"
        recalculateERA()
    }
    
    private func recalculateERA() {
        lblERA.text = String(format: "%.2f", viewModel.getERA(forBid: currentBidAmount!))
    }
  
}


