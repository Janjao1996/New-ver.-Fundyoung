//
//  customUIView.swift
//  FundYoung
//
//  Created by Janjao on 5/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class customUIView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        unclick()
    }
    
    func click() {
        layer.borderColor = #colorLiteral(red: 0.4705268741, green: 0.4359835684, blue: 0.8188018203, alpha: 1)
        layer.masksToBounds = false
        layer.borderWidth = 2
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.5
    }
    func unclick(){
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.masksToBounds = false
        layer.borderWidth = 0.5
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.5
        
    }

}



// function which is triggered when handleTap is called

