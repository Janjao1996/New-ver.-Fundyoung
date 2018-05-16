//
//  planTableCell.swift
//  FundYoung
//
//  Created by Janjao on 1/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class planTableCell: UITableViewCell {


    @IBOutlet weak var planNameLbl: UILabel!
    @IBOutlet weak var navlbl: UILabel!
    
    func updateView(plan: Plan) {
        
        planNameLbl.text = plan.PlanName
        navlbl.text = String(plan.totalPort)
        
    }
 

}
