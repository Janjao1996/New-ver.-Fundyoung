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
        var plan_:Plan!
        var fundList = [fundRatio]()
        @IBOutlet weak var pieChart : PieChartView!
        @IBOutlet weak var FundTable: UITableView!
        @IBOutlet weak var portRiskLabel: UILabel!
        var selectedFund: Fund!
        override func viewDidLoad() {
            super.viewDidLoad()
            portRiskLabel.text = "Your Port Risl : "
            print(plan_.PlanName)
            print(plan_.Target)
            print(plan_.NumberOfYear)
         
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
            print(fundList)
            
        }
            func getDataSet() -> PieChartDataSet {
                if fundList.count == 0{
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
                let fundRatio = fundList[indexPath.row]
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
            let numberOfFund = Double(fundList.count + 1)
            let ratio = 100.0/numberOfFund
            fundList.append(fundRatio(fund: fund, ratio: 100))
            for x in 0...fundList.count-1{
                fundList[x].ratio = ratio
            }
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return fundList.count
        }
        
        @IBAction func renderChart(){
            pieChartUpdate()
        }
        
        @IBAction func unwindFromEstimationVC(unwindSegue : UIStoryboardSegue){
            
        }
        @IBAction func unwindFromFundSelectionVC(unwindSegue : UIStoryboardSegue){
            
        }
}

