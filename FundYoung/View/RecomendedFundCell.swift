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
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var Return: UILabel!
    @IBOutlet weak var AMname: UILabel!
    
    func updateViews(fund: fundRatio){
        FundName.text = fund.fund.FundName
        weightLbl.text = String(fund.ratio)
        Return.text = "4"
        AMname.text = "SCBAM"
    }
    
}
