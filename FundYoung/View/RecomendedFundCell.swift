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
    @IBOutlet weak var riskLbl: UILabel!
    @IBOutlet weak var Return: UILabel!
    @IBOutlet weak var AMname: UILabel!
    
    func updateViews(fund: fundRatio){
      
        FundName.text = fund.fund.name
        weightLbl.text = String(fund.ratio)
        //riskLbl.text = String(fund.fund.risk ?? 0)
        Return.text = String(fund.fundreturn ?? 0)
        AMname.text = "SCBAM"
    }
    func totalcellUpdate(risk: Double , return_: Double){
         FundName.text = "   Total"
         riskLbl.text = String(risk)
         Return.text = String(return_ )
        
    }

    
}
