//
//  estimateSaving.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class estimateSaving: UIViewController {

    @IBOutlet weak var initialInvestLbl: UITextField!
    @IBOutlet weak var investOnceLbl: UILabel!
    @IBOutlet weak var monthlyLbl: UILabel!
    @IBOutlet weak var InitMonthlyLbl: UILabel!
    @IBOutlet weak var InvestOnceView: customUIView!
    @IBOutlet weak var MonthlyView: customUIView!
    @IBOutlet weak var initialView: customUIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        investOnceLbl.text = String(PlanDataService.instance.InvestOnce())
        monthlyLbl.text = String(PlanDataService.instance.InvestMonthly())
        
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        calcBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        calcBtn.layer.borderWidth = 0.5
        calcBtn.addTarget(self, action: #selector(estimateSaving.calculate), for: .touchUpInside)
        initialInvestLbl.inputAccessoryView = calcBtn
        let InvestOncetap = UITapGestureRecognizer(target: self, action: #selector(self.investOnceTapped(_:)))
        InvestOnceView.addGestureRecognizer(InvestOncetap)
        InvestOnceView.isUserInteractionEnabled = true
        
        let Monthlytap = UITapGestureRecognizer(target: self, action: #selector(self.monthlyTapped(_:)))
        MonthlyView.addGestureRecognizer(Monthlytap)
        MonthlyView.isUserInteractionEnabled = true
        let Initialtap = UITapGestureRecognizer(target: self, action: #selector(self.initialTapped(_:)))
        initialView.addGestureRecognizer(Initialtap)
        initialView.isUserInteractionEnabled = true
     
        
        
    }
    
    @IBAction func InintialTxtTapped(_ sender: Any) {
        PlanDataService.instance.TemperarydPlan.investType = "InvestSomeAndMonthly"
        initialView.click()
        InvestOnceView.unclick()
        MonthlyView.unclick()
    }
    @objc func investOnceTapped(_ sender: UITapGestureRecognizer){
        PlanDataService.instance.TemperarydPlan.investType = "InvestOnce"
        InvestOnceView.click()
        MonthlyView.unclick()
        initialView.unclick()
        PlanDataService.instance.TemperarydPlan.firstInvest = Double(PlanDataService.instance.InvestOnce())
        PlanDataService.instance.TemperarydPlan.nextInvest = 0
        
        
    }
    @objc func monthlyTapped(_ sender: UITapGestureRecognizer){
        PlanDataService.instance.TemperarydPlan.investType = "Monthly"
        MonthlyView.click()
        InvestOnceView.unclick()
        initialView.unclick()
        PlanDataService.instance.TemperarydPlan.firstInvest = Double(PlanDataService.instance.InvestMonthly())
    }
    @objc func initialTapped(_ sender: UITapGestureRecognizer){
        PlanDataService.instance.TemperarydPlan.investType = "InvestSomeAndMonthly"
        initialView.click()
        InvestOnceView.unclick()
        MonthlyView.unclick()
        
    }

    @objc func calculate(){
        let invest = Int(initialInvestLbl.text!)
        PlanDataService.instance.TemperarydPlan.firstInvest = Double(invest!)
        print(invest)
        let monthly = PlanDataService.instance.InvestSomeInit(invest: invest!)
        PlanDataService.instance.TemperarydPlan.nextInvest = Double(monthly)
        InitMonthlyLbl.text = String(monthly)
        view.endEditing(true)
        
    }
  
    
    @IBAction func unwindFromIdetifyingVC(unwindSegue : UIStoryboardSegue){
        
    }

}
