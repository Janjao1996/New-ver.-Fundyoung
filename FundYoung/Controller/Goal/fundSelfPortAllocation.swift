//
//  fundSelfPortAllocation.swift
//  FundYoung
//
//  Created by Janjao on 17/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Charts

class fundSelfPortAllocation: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    
        @IBOutlet weak var pieChart : PieChartView!
        @IBOutlet weak var FundTable: UITableView!
        @IBOutlet weak var portRiskLabel: UILabel!
        var selectedFund: Fund!
        override func viewDidLoad() {
            super.viewDidLoad()
            portRiskLabel.text = "Your Port Risl : "
         
            FundTable.dataSource = self
            FundTable.delegate = self
            pieChartUpdate()
            FundTable.sizeToFit()
        }
   
        func pieChartUpdate(){
            
            
            let dataSet = getDataSet()
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
            func getDataSet() -> PieChartDataSet {
                if PlanDataService.instance.tempfundRatoList.count == 0{
                    let dataSet = PieChartDataSet()
                    return dataSet
                }
                else{
                    let dataSet = PieChartDataSet()
                    return dataSet
                    
                }
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let fundCell = tableView.dequeueReusableCell(withIdentifier: "ReccomendFund") as? RecomendedFundCell{
                let fundRatio = PlanDataService.instance.tempfundRatoList[indexPath.row]
                fundCell.updateViews(fund: fundRatio)
                fundCell.sizeToFit()
                return fundCell
            }
            else{
                print("fail")
                return RecomendedFundCell()
                
                
                
            }
        }
        func initFund(fund: Fund) {
            let numberOfFund = Double(PlanDataService.instance.tempfundRatoList.count + 1)
            let ratio = 100.0/numberOfFund
            PlanDataService.instance.tempfundRatoList.append(fundRatio(fund: fund, ratio: 100))
            for x in 0...PlanDataService.instance.tempfundRatoList.count-1{
                 PlanDataService.instance.tempfundRatoList[x].ratio = ratio
            }
        
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return PlanDataService.instance.tempfundRatoList.count
        }
        
        @IBAction func renderChart(){
            pieChartUpdate()
        }
        
        @IBAction func unwindFromEstimationVC(unwindSegue : UIStoryboardSegue){
            
        }
        @IBAction func unwindFromFundSelectionVC(unwindSegue : UIStoryboardSegue){
            
        }
}

