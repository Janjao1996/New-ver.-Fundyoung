//
//  lightGreyBtnBorder.swift
//  FundYoung
//
//  Created by Janjao on 19/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class lightGreyBtnBorder: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0.6910474896, green: 0.6869416237, blue: 0.6942049265, alpha: 0.5962382277)
        layer.cornerRadius = 5.0
        
    }

}
