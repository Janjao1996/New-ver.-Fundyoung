//
//  RebalanceVC.swift
//  FundYoung
//
//  Created by Janjao on 20/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Charts

class RebalanceVC: UIViewController {
    

    @IBOutlet weak var DoneBtn: UIButton!
    @IBOutlet weak var RelalanceBtn: UIButton!
    @IBOutlet weak var pieChart: PieChartView!
    var plan_ :Plan!
    @IBOutlet weak var GoalNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GoalNameLbl.text = plan_.PlanName
        DoneBtn.isHidden = true
        pieChartUpdate()
        
    }
    func initPlan(plan: Plan){
        plan_ = PlanDataService.instance.getPlan(forPlanID: plan.Id)
        print(plan_.PlanName)
    }

    
    @IBAction func RebalancePressed(_ sender: Any) {
        if DoneBtn.isHidden{
            DoneBtn.isHidden = false
            RelalanceBtn.isHidden = true
        }
        
    }
    func pieChartUpdate(){
        
        let entry1 = PieChartDataEntry(value: Double(50.0), label: "#1")
        let entry2 = PieChartDataEntry(value: Double(50.0), label: "#2")
        let dataSet = PieChartDataSet(values: [entry1, entry2], label: "Widget Types")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Share of Widgets by Type"
        dataSet.colors = ChartColorTemplates.joyful()
        //dataSet.valueColors = [UIColor.black]
        pieChart.backgroundColor = UIColor.white
        pieChart.holeColor = UIColor.clear
        pieChart.chartDescription?.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        pieChart.legend.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        pieChart.notifyDataSetChanged()
        
    }
    
  
}
