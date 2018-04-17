//
//  fundRecommendationVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Charts

class fundRecommendationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var custom = false
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if custom == false{
            if let fundCell = tableView.dequeueReusableCell(withIdentifier: "ReccomendFund") as? RecomendedFundCell{
                let fundRatio = FundDataService.instance.getFundByRisk(risk: plan.Risk)[indexPath.row]
                fundCell.updateViews(fund: fundRatio)
                fundCell.sizeToFit()
                return fundCell
            }
            else{
                print("fail")
                return RecomendedFundCell()
                
            }
            
        }
        else{
            return RecomendedFundCell()
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FundDataService.instance.getFundByRisk(risk: plan.Risk).count
    }
    
    var plan:Plan!
    var fundList = [fundRatio]()
    @IBOutlet weak var pieChart : PieChartView!
    @IBOutlet weak var FundTable: UITableView!
    
    @IBOutlet weak var portRiskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        portRiskLabel.text = "Your Port Risl : "
        print(plan.PlanName)
        print(plan.Target)
        print(plan.NumberOfYear)
        print(plan.Risk)
        FundTable.dataSource = self
        FundTable.delegate = self
        pieChartUpdate()
        FundTable.sizeToFit()
    }
    func pieChartUpdate(){
        
        
        let dataSet = getDataSet(risk: plan.Risk)
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Fund"
        dataSet.colors = ChartColorTemplates.joyful()
        //dataSet.valueColors = [UIColor.black]
        pieChart.backgroundColor = UIColor.white
        pieChart.holeColor = UIColor.clear
        pieChart.chartDescription?.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        pieChart.legend.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        pieChart.notifyDataSetChanged()
        
        
    }
    func getDataSet(risk: Int) -> PieChartDataSet {
        let dataSet = FundDataService.instance.getFundWeightChart(risk: risk)
       return dataSet
    }
    @IBAction func renderChart(){
        pieChartUpdate()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let FundSelf = segue.destination as? fundSelfPortAllocation{
            let plan_ = plan
            FundSelf.plan_ = plan_
            
        }
    }
    @IBAction func SelfPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSelf", sender: self)
        
    }
    @IBAction func unwindFromEstimationVC(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func unwindFromFundSelfPortVC(unwindSegue : UIStoryboardSegue){
        
    }
}

