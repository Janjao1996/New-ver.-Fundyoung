//
//  namedVC.swift
//  FundYoung
//
//  Created by Janjao on 28/3/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class namedVC: UIViewController {
    

    @IBOutlet weak var nameInput: txtfieldStyle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        doneBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
        doneBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneBtn.layer.borderWidth = 0.5
        doneBtn.addTarget(self, action: #selector(namedVC.done), for: .touchUpInside)
        nameInput.inputAccessoryView = doneBtn
    }

    @objc func done() {
        if let nameInput = nameInput.text{
            PlanDataService.instance.TemperarydPlan.PlanName = nameInput
            view.endEditing(true)
        }
    }
    @IBAction func unwindFromSummaryPortVC(unwindSegue : UIStoryboardSegue){
        
    }
    

   
}
