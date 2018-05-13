//
//  RebalanceCell.swift
//  FundYoung
//
//  Created by Janjao on 13/5/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class RebalanceCell: UITableViewCell {

    @IBOutlet weak var totalNAV: UILabel!
    @IBOutlet weak var InvestValue: UILabel!
    
    @IBOutlet weak var fundname: UILabel!
    @IBOutlet weak var navPrice: UILabel!
    @IBOutlet weak var totalUnit: UILabel!
    
    @IBOutlet weak var Profit: UILabel!
    
    func updateView(fund: FundNAV){
        fundname.text = fund.fund.fund.name
        totalNAV.text = String(fund.totalNAV)
        InvestValue.text = String(fund.investvalue)
        navPrice.text = String(fund.NAV)
        totalUnit.text = String(fund.totalunit)
        Profit.text = String(fund.profit)
        
    }

}
