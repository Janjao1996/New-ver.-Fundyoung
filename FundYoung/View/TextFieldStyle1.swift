//
//  TextFieldStyle1.swift
//  FundYoung
//
//  Created by Janjao on 19/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
@IBDesignable
class TextFieldStyle1: UITextField {
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
        
        
    }
    func customizeView(){
        backgroundColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0.7986943493)
        layer.cornerRadius = 5.0
        layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.borderWidth = 0.5
        textAlignment = .center
        
        if let p = placeholder{
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.8545590753)
        }
    }

}
