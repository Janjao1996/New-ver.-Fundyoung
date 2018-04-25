//
//  fundRecommendationVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Charts
import Alamofire


class fundRecommendationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var custom = false
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if custom == false{
            if let fundCell = tableView.dequeueReusableCell(withIdentifier: "ReccomendFund") as? RecomendedFundCell {
                let fundRatio = fundList[indexPath.row]
                fundCell.updateViews(fund: fundRatio)
                fundCell.sizeToFit()
                return fundCell
            }
            else{
                let totalCell = RecomendedFundCell()
                let risk = PlanDataService.instance.getTotalRisk()
                let return_ = PlanDataService.instance.getTotalReturn()
                totalCell.totalcellUpdate(risk: risk, return_: return_)
                return totalCell
                
            }
            
        }
        else{
            return RecomendedFundCell()
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fundList.count 
    }
  
    var fundList = [fundRatio]()
    @IBOutlet weak var pieChart : PieChartView!
    @IBOutlet weak var FundTable: UITableView!
    var fundreturn = 0.0
    @IBOutlet weak var portRiskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        FundTable.dataSource = self
        FundTable.delegate = self
        PlanDataService.instance.requestFundByRisk(Risk: PlanDataService.instance.TemperarydPlan.Risk) { (list) in
            for x in list{
               self.fundList.append(x)
            }
            for x in 0...self.fundList.count-1{
                FundDataService.instance.requestFundReturn(fundID: self.fundList[x].fund.name, completionHandle: { (return_) in
                    let twodigitReturn = Double(round(100*return_)/100)
                    self.fundList[x].fundreturn = twodigitReturn
                    self.FundTable.reloadData()
                    
                })
               
            }
        }
       
   
            
        
            
        
        
//        print(fundList)
//
        portRiskLabel.text = "Your Port Risl : "
        pieChartUpdate()
        FundTable.sizeToFit()
     
    }
    
    
    
    
    
    func pieChartUpdate(){
        let dataSet = getDataSet(risk: PlanDataService.instance.TemperarydPlan.Risk)
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Fund"
        dataSet.colors = ChartColorTemplates.joyful()
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
    }/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let FundSelf = segue.destination as? fundSelfPortAllocation{
            let plan_ = plan
            FundSelf.plan_ = plan_
            
        }
    }*/
    @IBAction func SelfPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSelf", sender: self)
        
    }
    
    @IBAction func unwindFromEstimationVC(unwindSegue : UIStoryboardSegue){
    }
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func unwindFromFundSelfPortVC(unwindSegue : UIStoryboardSegue){
        
    }
   
}

