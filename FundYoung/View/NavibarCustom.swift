//
//  NavibarCustom.swift
//  FundYoung
//
//  Created by Janjao on 15/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class NavibarCustom: UIView {
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.6685273051, green: 0.6336535215, blue: 0.9937500358, alpha: 1){
        didSet{
            self.setNeedsLayout()
        }
    }
    @IBInspectable var buttomColor: UIColor = #colorLiteral(red: 0.3711799383, green: 0.4678527713, blue: 0.962004602, alpha: 1){
        didSet{
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor,buttomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0 )
    }
   
}
