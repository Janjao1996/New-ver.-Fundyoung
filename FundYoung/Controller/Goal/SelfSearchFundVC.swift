//
//  SelfSearchFundVC.swift
//  FundYoung
//
//  Created by Janjao on 19/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class SelfSearchFundVC: UIViewController {

   
    
    
    @IBOutlet var amSelected: [UIButton]!
    @IBOutlet var policySelected: [UIButton]!
    @IBOutlet var assetType: [UIButton]!
    
    @IBOutlet weak var fundAM: UIStackView!
    @IBOutlet weak var Policy: UIStackView!
    @IBOutlet weak var fundAssetType: UIStackView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fundAM.sizeToFit()
        Policy.sizeToFit()
        fundAssetType.sizeToFit()
        
        
    }
    @IBAction func firstStackHandleSelection(_ sender: Any) {
        amSelected.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
                
                
            })
            
        }
    }
    @IBAction func criteria1Tapped(_ sender: UIButton) {
    }
    
    @IBAction func secondStackHandleSelection(_ sender: Any) {
        policySelected.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
                
                
            })
        }
    }
    
    @IBOutlet weak var AllBtnPressed: UIButton!
    
    @IBAction func AllFundsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSelectFunds", sender: self)
    }
    @IBAction func criteria2Tapped(_ sender: UIButton) {
    }
    @IBAction func ThirdStackHandleSelection(_ sender: Any){
        assetType.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
                
                
            })
        }
    }
}


