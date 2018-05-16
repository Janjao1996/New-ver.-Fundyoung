//
//  RebalanceVC.swift
//  FundYoung
//
//  Created by Janjao on 20/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Charts

class RebalanceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fundlist[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "funds") as? RebalanceCell {
            let fundRatioNAV = fundlist[indexPath.section].list[indexPath.row]
            fundCell.updateView(fund:fundRatioNAV)
            return fundCell
        }
        else{
            return UITableViewCell()
            
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return fundlist.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Money Market"
        }
        else if section == 1{
            return "Fixed Income"
        }else if section == 2{
            return "Equity"
        }
        else{
            return "Commodities"
        }
    }
    @IBOutlet weak var DoneBtn: UIButton!
    @IBOutlet weak var RelalanceBtn: UIButton!
    @IBOutlet weak var pieChart: PieChartView!
    var plan_ :Plan!
    @IBOutlet weak var GoalNameLbl: UILabel!
    @IBOutlet weak var targetLbl: UILabel!
    @IBOutlet weak var DurationLbl: UILabel!
    
    
    @IBOutlet weak var pie: PieChartView!
    @IBOutlet weak var tableView: UITableView!
    var MM = fundTypes(type: "Money Market")
    var FI = fundTypes(type: "Fixed Income")
    var EQ = fundTypes(type: "Equity")
    var CM = fundTypes(type: "Commodities")
 
    @IBOutlet weak var totalPort: UILabel!
    var fundlist = [fundTypes]()
    var PiechartData = [FundNAV]()
    override func viewDidLoad() {
        super.viewDidLoad()
        PlanDataService.instance.planFunds.removeAll()
        fundlist.removeAll()
        PiechartData.removeAll()
        totalPort.text = String(plan_.totalPort)
        GoalNameLbl.text = plan_.PlanName
        targetLbl.text = String(plan_.Target)
        DurationLbl.text = String(plan_.NumberOfYear)
        tableView.dataSource = self
        tableView.delegate = self
        fundlist.append(MM)
        fundlist.append(FI)
        fundlist.append(EQ)
        fundlist.append(CM)
        PlanDataService.instance.getfundPlanByID(planId: String(plan_.Id)) { (list, plan) in
            
            for x in list{
                self.PiechartData.append(x)
                if x.fund.fund.type == "Money market"{
                    self.fundlist[0].list.append(x)
                }
                else if x.fund.fund.type == "Fixed Income"{
                    self.fundlist[1].list.append(x)
                }
                else if x.fund.fund.type == "Equity"{
                    self.fundlist[2].list.append(x)
                    
                }
                else if x.fund.fund.type == "Commodities"{
                    self.fundlist[3].list.append(x)
                    
                }
               // self.updateLbl(lbl: String(plan.totalPort))
                self.tableView.reloadData()
                self.pieChartUpdate()
            }
            //self.totalPort.text = String(plan.totalPort)
        }
    
    }
    func initPlan(plan: Plan){
        plan_ = Plan(Id: plan.Id, PlanName: plan.PlanName, Target: plan.Target, NumberOfYear: plan.NumberOfYear)
        
        
    }
  
    
    @IBAction func RebalancePressed(_ sender: Any) {
        if DoneBtn.isHidden{
            DoneBtn.isHidden = false
            RelalanceBtn.isHidden = true
        }
        
    }
    func pieChartUpdate(){
        
        let dataSet = getDataSet()
        let data = PieChartData(dataSet: dataSet)
        print(data.dataSets)
        dataSet.colors = ChartColorTemplates.material()
        pie.data = data
        pie.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pie.holeRadiusPercent = 0.4
        pie.drawEntryLabelsEnabled = false
        pie.drawHoleEnabled = true
        pie.transparentCircleRadiusPercent = 0.5
        pie.rotationEnabled = false
        pie.holeColor = UIColor.clear
        pie.legend.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pie.notifyDataSetChanged()
    }
    func getDataSet()-> PieChartDataSet{
        var entries = [PieChartDataEntry]()
        for x in 0...PiechartData.count-1{
            let entry = PieChartDataEntry(value: PiechartData[x].fund.ratio, label: PiechartData[x].fund.fund.type)
            entries.append(entry)
        }
        let dataSet = PieChartDataSet(values: entries, label: nil)
        return dataSet
    }
    
    
  
}


