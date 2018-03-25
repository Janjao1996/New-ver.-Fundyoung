//
//  txtfieldStyle.swift
//  FundYoung
//
//  Created by Janjao on 25/3/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class txtfieldStyle: UITextField {
    var textField: UITextView!
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
        
        
    }
    func customizeView(){
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        textAlignment = .center
        if let p = placeholder{
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        }
    }

}
