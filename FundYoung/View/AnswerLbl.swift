//
//  AnswerLbl.swift
//  FundYoung
//
//  Created by Janjao on 13/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class AnswerLbl: UILabel {

    override func awakeFromNib() {
        self.textAlignment = .center
        self.numberOfLines = 4
        self.layer.backgroundColor = #colorLiteral(red: 0.9866852164, green: 0.9836216569, blue: 0.9890882373, alpha: 1)
        self.font = UIFont(name: "Avenir Next", size: 14)
        
    }

}
