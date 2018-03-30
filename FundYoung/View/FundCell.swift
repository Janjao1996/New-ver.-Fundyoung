//
//  FundCell.swift
//  FundYoung
//
//  Created by Janjao on 18/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class FundCell: UITableViewCell {
  
    
    @IBOutlet weak var FundName: UILabel!
    @IBOutlet weak var FundRisk: UILabel!
    @IBOutlet weak var FundReturn: UILabel!
    
    @IBOutlet weak var AddBtn: UIButton!
    func updateViews(fund: Fund){
        FundName.text = fund.FundName
        FundRisk.text = String(fund.Risk)
        FundReturn.text = String(fund.Return)
        
    }
   

    
    
    
   

}
