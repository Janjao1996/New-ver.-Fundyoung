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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let fundCell = tableView.dequeueReusableCell(withIdentifier: "ReccomendFund") as? RecomendedFundCell{
                let fund = FundDataService.instance.getFunds()[indexPath.row]
                fundCell.updateViews(fund: fund)
                return fundCell
            }
            else{
                print("fail")
                return RecomendedFundCell()
                
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FundDataService.instance.getFunds().count
    }
    
    var plan:Plan!
    @IBOutlet weak var pieChart : PieChartView!
    @IBOutlet weak var FundTable: UITableView!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(plan.PlanName)
        print(plan.Target)
        print(plan.NumberOfYear)
        FundTable.dataSource = self
        FundTable.delegate = self
        pieChartUpdate()
   
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
    @IBAction func renderChart(){
        pieChartUpdate()
    }
    
    @IBAction func unwindFromEstimationVC(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func unwindFromFundSelectionVC(unwindSegue : UIStoryboardSegue){
        
    }
}
