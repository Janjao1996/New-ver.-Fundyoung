//
//  DurationVC.swift
//  FundYoung
//
//  Created by Janjao on 3/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class DurationVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var yearInput: UITextView!
    
  
    @IBOutlet weak var NextBtn: DarkGreyBtnBorder!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return year.count
    }
    
    let yearPicker = UIPickerView()
    let year = ["1 year","2 years","3 years","4 years","5 years","6 years","7 years","8 years","9 years","10 years"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        yearPicker.backgroundColor = #colorLiteral(red: 0.9859201312, green: 0.9828589559, blue: 0.9883212447, alpha: 1)
        yearPicker.dataSource = self
        yearPicker.delegate = self
        yearInput.textAlignment = .center
        yearInput.inputView = yearPicker
      
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return year[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NextBtn.isEnabled = true
        PlanDataService.instance.TemperarydPlan.NumberOfYear = row + 1
        yearInput.text = year[row]
        yearInput.resignFirstResponder()
    }
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "RiskVC", sender: self)
    }
    
    @IBAction func unwindFromRiskVC(unwindSegue : UIStoryboardSegue){
        
    }
    
    

}


