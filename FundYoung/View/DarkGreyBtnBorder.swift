//
//  DarkGreyBtnBorder.swift
//  FundYoung
//
//  Created by Janjao on 19/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class DarkGreyBtnBorder: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5947934503)
        layer.cornerRadius = 5.0
        
        
        
    }

}
