//
//  EstimateTableViewCell.swift
//  FundYoung
//
//  Created by Janjao on 1/5/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class EstimateTableViewCell: UITableViewCell {
    @IBOutlet weak var fundname: UILabel!
    
    @IBOutlet weak var investValue: UILabel!
    
    @IBOutlet weak var totalUnit: UILabel!
    
    @IBOutlet weak var NAVperUnit: UILabel!
    func updatView(fund: FundNAV) {
        fundname.text = fund.fund.fund.name
            
        investValue.text = String(Double(PlanDataService.instance.TemperarydPlan.firstInvest) * fund.fund.ratio * 0.01)
        totalUnit.text = String(Int(Double(PlanDataService.instance.TemperarydPlan.firstInvest) * fund.fund.ratio * (1/fund.NAV) * 0.01))
                                
        NAVperUnit.text = String(fund.NAV)
    }
    
    
}
