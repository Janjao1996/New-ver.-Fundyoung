//
//  DurationVC.swift
//  FundYoung
//
//  Created by Janjao on 3/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class DurationVC: UIViewController {

    @IBOutlet weak var yearInput: UITextView!
    
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
        doneBtn.addTarget(self, action: #selector(DurationVC.done), for: .touchUpInside)
      
        yearInput.inputAccessoryView = doneBtn
        
        
        
    }
    
    @objc func done() {
        
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
            risk.plan_ = plan
            
        }
    }
    @IBAction func unwindFromRiskVC(unwindSegue : UIStoryboardSegue){
        
    }
    
    

}
