//
//  PlanCellStyle.swift
//  FundYoung
//
//  Created by Janjao on 12/3/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class PlanCellStyle: UIView {

    override func awakeFromNib() {
        backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.masksToBounds = false
        layer.borderWidth = 0.5
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5

    }

}
