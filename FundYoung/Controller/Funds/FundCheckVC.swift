//
//  FundCheckVC.swift
//  FundYoung
//
//  Created by Janjao on 20/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class FundCheckVC:  UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fund = FundDataService.instance.getAllFunds()[indexPath.row]
        performSegue(withIdentifier: "fundDetail", sender: fund)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SelfSelectVC = segue.destination as? fundSelfPortAllocation{
            assert(sender as? Fund != nil)
            SelfSelectVC.initFund(fund: sender as! Fund)
        }
    }
    
    @IBOutlet weak var FundTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return FundDataService.instance.getAllFunds().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "FundCell") as? FundCell{
            let fund = FundDataService.instance.getAllFunds()[indexPath.row]
            fundCell.updateViews(fund: fund)
            return fundCell
            
        }
        else{
            return FundCell()
        }
        
    }
    
    
    
    
    
    
    
    var fundtype: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        FundTable.dataSource = self
        FundTable.delegate = self
        FundDataService.instance.requestAllFundData {
            self.FundTable.reloadData()
        }
        
        
        
        
        
        
        
    }
    
    
    
    
}
