//
//  RecomendedFundCell.swift
//  FundYoung
//
//  Created by Janjao on 20/3/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class RecomendedFundCell: UITableViewCell {
    
    @IBOutlet weak var FundName: UILabel!
    
    func updateViews(fund: Fund){
        FundName.text = fund.FundName
    }
    
}
