//
//  RiskSelectedVC.swift
//  FundYoung
//
//  Created by Janjao on 25/3/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class RiskSelectedVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return risk.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return risk[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        RiskResult.text = risk[row]
    }
    
    let risk = ["Risk-Adverse","Conservative","Balanced","Advanced","Aggressive"]
 
    
    var plan:Plan!
 
    @IBOutlet weak var RiskResult: TextFieldStyle1!
    @IBOutlet weak var riskPicker: UIPickerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        RiskResult.text = risk[0]
        riskPicker.dataSource = self
        riskPicker.delegate = self
        print(plan.PlanName)
        print(plan.Target)
        print(plan.NumberOfYear)
        
    
        
    }
  


}
