//
//  GradieantView.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

@IBDesignable
class GradieantView: UIView {
    @IBInspectable var topColor: UIColor = UIColor.white{
        didSet{
            self.setNeedsLayout()
        }
    }
    @IBInspectable var buttomColor: UIColor = UIColor.white{
        didSet{
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor,buttomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0 )
    }

}
