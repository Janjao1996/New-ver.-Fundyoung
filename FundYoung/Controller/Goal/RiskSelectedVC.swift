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
        //assign risk to plan
        PlanDataService.instance.TemperarydPlan.Risk = row + 1
    }
    
    let risk = ["ความเสี่ยงต่ำมาก","ความเสี่ยงต่ำ","ความเสี่ยงปานกลาง","ความเสี่ยงสูง","ความเสี่ยงสูงมาก"]
    
    
    @IBOutlet weak var riskPicker: UIPickerView!
    @IBAction func nextBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "RecommendationVC", sender: self)
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let Fundreccomendation = segue.destination as? fundRecommendationVC{
            let plan = plan_
            Fundreccomendation.plan = plan
            
        }
    }*/
    override func viewDidLoad() {
        
        super.viewDidLoad()
        PlanDataService.instance.TemperarydPlan.Risk = 1
        riskPicker.dataSource = self
        riskPicker.delegate = self
      
        
    }
    @IBAction func unwindFromRecommendationVC(unwindSegue : UIStoryboardSegue){
        PlanDataService.instance.tempfundRatoList.removeAll()
        
        
    }
    
    
    
}



