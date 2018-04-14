//
//  QuestionLabel.swift
//  FundYoung
//
//  Created by Janjao on 13/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class QuestionLabel: UILabel {

    override func awakeFromNib() {
        
        self.numberOfLines = 5
        self.font = UIFont(name: "Avenir Next", size: 16)
       
    }
}
