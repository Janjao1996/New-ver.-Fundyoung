//
//  fundSelectionVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Alamofire

class fundSelectionVC: UIViewController, UITableViewDataSource, UITableViewDelegate, fundCellDelegate  {
    func DidTapAdd(fund: Fund) {
        performSegue(withIdentifier: "AddFund", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selfFundVC = segue.destination as? fundSelfPortAllocation{
            print("func prepare")
            assert(sender as? Fund != nil)
            selfFundVC.initFund(fund: sender as! Fund)
            
        } 
    }
    
    @IBOutlet weak var FundTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return Funds.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "FundCell") as? FundCell{
            let fund = Funds[indexPath.row]
            fundCell.updateViews(fund: fund)
            fundCell.delegate = self
            return fundCell
            
        }
        else{
            return FundCell()
        }
        
    }
    var fundtype: String!
    var Funds = [Fund]()
    override func viewDidLoad() {
        super.viewDidLoad()
        FundDataService.instance.requestAllFundData()
        FundTable.dataSource = self
        FundTable.delegate = self
        
        

      
    }
    func getType(type: String){
        fundtype = type
    }
    
    
    
   
}

