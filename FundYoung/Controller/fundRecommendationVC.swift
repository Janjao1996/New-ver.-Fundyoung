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
        print(plan.Risk)
        FundTable.dataSource = self
        FundTable.delegate = self
        pieChartUpdate()
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
        switch risk {
        case 1:
            let entry1 = PieChartDataEntry(value: Double(30.0), label: "#สินทรัพย์สภาพคล่อง")
            let entry2 = PieChartDataEntry(value: Double(70.0), label: "#ตราสารหนี้")
            let dataSet = PieChartDataSet(values: [entry1, entry2], label: "Fund")
            return dataSet
            
        case 2:
            let entry1 = PieChartDataEntry(value: Double(16.0), label: "#ตราสารผสม")
            let entry2 = PieChartDataEntry(value: Double(16.0), label: "#ตรสารทุน")
            let entry3 = PieChartDataEntry(value: Double(20.0), label: "#สินทรัพย์สภาพคล่อง")
            let entry4 = PieChartDataEntry(value: Double(48.0), label: "#ตราสารหนี้")
            let dataSet = PieChartDataSet(values: [entry1, entry2, entry3, entry4], label: "Fund")
            return dataSet
            
        case 3:
            let entry1 = PieChartDataEntry(value: Double(16.0), label: "#ตราสารผสม")
            let entry2 = PieChartDataEntry(value: Double(32.0), label: "#ตรสารทุน")
            let entry3 = PieChartDataEntry(value: Double(15.0), label: "#สินทรัพย์สภาพคล่อง")
            let entry4 = PieChartDataEntry(value: Double(70.0), label: "#ตราสารหนี้")
            let entry5 = PieChartDataEntry(value: Double(2.0), label: "#สินค้าโภคภัณฑ์")
            let dataSet = PieChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "Fund")
            return dataSet
        case 4:
            let entry1 = PieChartDataEntry(value: Double(20.0), label: "#ตราสารผสม")
            let entry2 = PieChartDataEntry(value: Double(48.0), label: "#ตรสารทุน")
            let entry3 = PieChartDataEntry(value: Double(10.0), label: "#สินทรัพย์สภาพคล่อง")
            let entry4 = PieChartDataEntry(value: Double(70.0), label: "#ตราสารหนี้")
            let entry5 = PieChartDataEntry(value: Double(2.0), label: "#สินค้าโภคภัณฑ์")
            let dataSet = PieChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "Fund")
            return dataSet
        case 5:
            let entry1 = PieChartDataEntry(value: Double(24.0), label: "#ตราสารผสม")
            let entry2 = PieChartDataEntry(value: Double(68.0), label: "#ตรสารทุน")
            let entry3 = PieChartDataEntry(value: Double(5.0), label: "#สินทรัพย์สภาพคล่อง")
            let entry5 = PieChartDataEntry(value: Double(3.0), label: "#สินค้าโภคภัณฑ์")
            let dataSet = PieChartDataSet(values: [entry1, entry2, entry3, entry5], label: "Fund")
            return dataSet
        default:
            let entry = PieChartDataEntry(value: Double(100.0), label: "#ตราสารหนี้")
            let dataSet = PieChartDataSet(values: [entry], label: "Fund")
            return dataSet
            
        }
        
    }
    @IBAction func renderChart(){
        pieChartUpdate()
    }
    
    @IBAction func unwindFromEstimationVC(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func unwindFromFundSelectionVC(unwindSegue : UIStoryboardSegue){
        
    }
}

