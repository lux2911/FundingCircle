//
//  ViewController.swift
//  FundingCircle
//
//  Created by Tomislav Luketic on 6/3/19.
//  Copyright © 2019 lux. All rights reserved.
//

import UIKit

class AuctionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var viewModel: AuctionsViewModel = {
        return AuctionsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initViewModel()
        loadAuctions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowERA" {
            let vc = segue.destination as! EstimatedReturnViewController
            let indexPath = tableView.indexPathsForSelectedRows!.first!
            vc.viewModel.auction = viewModel.auctions[indexPath.row]
        }
    }
 
// MARK: - Privates
    private func initView() {
        tableView.tableFooterView = UIView()
    }
    
    private func initViewModel() {
        
        viewModel.reloadData = {
            self.reloadData()
        }
        viewModel.displayError = { error in
            self.displayError(error: error)
        }
    }
    
    private func loadAuctions() {
        viewModel.getAuctions()
    }
    
    private func reloadData() {
        tableView.reloadData()
    }
    
    private func displayError(error: Error) {
        showAlert(error.localizedDescription, title: "Error")
    }
    
    private func showAlert( _ message: String, title: String = "Alert" ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

// MARK: - UITableViewDataSource
extension AuctionsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.auctions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuctionCell", for: indexPath) as! AuctionCell
        cell.configure(with: viewModel.auctions[indexPath.row])
        return cell
    }
    
    
}

