//
//  PlanCell.swift
//  FundYoung
//
//  Created by Janjao on 12/3/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class PlanCell: UITableViewCell {
    @IBOutlet weak var planName:UILabel!
    func updateView(plan: Plan){
        planName.text = plan.PlanName
    }
    
    

    

}
