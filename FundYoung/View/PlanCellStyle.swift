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
        layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        layer.borderWidth = 0.5
        layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255/0, alpha: 1.0).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.opacity = 1
        layer.shadowRadius = 5

    }

}
