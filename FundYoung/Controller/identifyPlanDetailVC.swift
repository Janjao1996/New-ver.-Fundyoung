//
//  identifyPlanDetailVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class identifyPlanDetailVC: UIViewController {
    
    @IBOutlet weak var nameInput: TextFieldStyle1!
    @IBOutlet weak var targetInput: TextFieldStyle1!
    @IBOutlet weak var yearInput: TextFieldStyle1!
    
    var namePlan = ""
    var targetPlan = 0
    var yearPlan = 0
    
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
        let doneBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        doneBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
        doneBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneBtn.layer.borderWidth = 0.5
        doneBtn.addTarget(self, action: #selector(identifyPlanDetailVC.done), for: .touchUpInside)
        
        nameInput.inputAccessoryView = doneBtn
        targetInput.inputAccessoryView = doneBtn
        yearInput.inputAccessoryView = doneBtn
        
        
    
    }
    
    @objc func done() {
        if let nameInput = nameInput.text{
       
            namePlan = nameInput
            view.endEditing(true)
        }
        if let targetInput = targetInput.text{
            if let target = Int(targetInput){
                targetPlan = target
               
                view.endEditing(true)
            }
        }
        if let yearInput = yearInput.text{
            if let year = Int(yearInput){
                yearPlan = year
                view.endEditing(true)
            }
        }
        
    }
    
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "RiskVC", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let risk = segue.destination as? RiskSelectedVC{
            let plan = Plan(Id: 0 ,PlanName: namePlan, Target: targetPlan, NumberOfYear: yearPlan)
                risk.plan = plan
            
        }
    }
    @IBAction func unwindFromFundrecommendationVC(unwindSegue : UIStoryboardSegue){
        
    }
  

   
}
