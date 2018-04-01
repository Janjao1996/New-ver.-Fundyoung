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
    func updateView(plan: Plan) {
        planNameLbl.text = plan.PlanName
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
