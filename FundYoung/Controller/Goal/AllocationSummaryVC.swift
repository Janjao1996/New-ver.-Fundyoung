//
//  AllocationSummaryVC.swift
//  FundYoung
//
//  Created by Janjao on 27/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Charts
import FirebaseAuth
import Alamofire
import SwiftyJSON

class AllocationSummaryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fundlist[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "funds") as? EstimateTableViewCell {
            let fundRatioNAV = fundlist[indexPath.section].list[indexPath.row]
            fundCell.updatView(fund:fundRatioNAV)
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
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var targetlbl: UILabel!
    @IBOutlet weak var durationlbl: UILabel!
    @IBOutlet weak var pie: PieChartView!
    @IBOutlet weak var tableView: UITableView!
    var MM = fundTypes(type: "Money Market")
    var FI = fundTypes(type: "Fixed Income")
    var EQ = fundTypes(type: "Equity")
    var CM = fundTypes(type: "Commodities")
    
    var fundlist = [fundTypes]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
     
        namelbl.text = PlanDataService.instance.TemperarydPlan.PlanName
        
        targetlbl.text = String(PlanDataService.instance.TemperarydPlan.Target)
        durationlbl.text = String(PlanDataService.instance.TemperarydPlan.NumberOfYear)
        
        fundlist.append(MM)
        fundlist.append(FI)
        fundlist.append(EQ)
        fundlist.append(CM)
        for x in PlanDataService.instance.tempfundRatoList{
            FundDataService.instance.getFundNAV(fundID: x.fund.name) { (NAV) in
                let twodigitNAV = Double((NAV/100)*100)
                let fund = FundNAV(fund: x, NAV: twodigitNAV)
                print(fund)
                if x.fund.type == "Money market"{
                    self.fundlist[0].list.append(fund)
                }
                else if x.fund.type == "Fixed Income"{
                    self.fundlist[1].list.append(fund)
                }
                else if x.fund.type == "Equity"{
                    self.fundlist[2].list.append(fund)
                    
                }
                else if x.fund.type == "Commodities"{
                    self.fundlist[3].list.append(fund)
                    
                }
                
                self.tableView.reloadData()
                
            }
            
        }
        
       
        pieChartUpdate()
    }

    func pieChartUpdate(){
        let dataSet = PlanDataService.instance.getFundWeightChart(risk: PlanDataService.instance.TemperarydPlan.Risk)
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
    

    @IBAction func renderChart(){
        pieChartUpdate()
    }
    @IBAction func CreatePlanPressed(_ sender: Any) {
        let idToken = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + idToken!
        ]
        //print(headers)
        //print(idToken)
        let parameters = [
            "name": PlanDataService.instance.TemperarydPlan.PlanName,
            "target": PlanDataService.instance.TemperarydPlan.Target,
            "duration": PlanDataService.instance.TemperarydPlan.NumberOfYear,
            "startdate": "2013-01-01",
            "enddate": "2013-01-01",
            "firstinvest": PlanDataService.instance.TemperarydPlan.firstInvest,
            "nextinvest": PlanDataService.instance.TemperarydPlan.nextInvest
            
            
            ] as [String : Any]
        print(parameters)
        let URL = "https://fundyoung.herokuapp.com/plan/addplan"
        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { (respone) in
            if respone.result.error == nil{
                do {
                    
                    let planID =  1
                    print(planID)
                    for x in PlanDataService.instance.tempfundRatoList{
                        let add_fund_URL = "https://fundyoung.herokuapp.com/plan/addfundplan"
                        let fund_parameter = ["planid": planID,
                                              "fundid": x.fund.name,
                                              "weight": x.ratio
                            ] as [String : Any]
                        Alamofire.request(add_fund_URL, method: .post, parameters: fund_parameter, encoding: JSONEncoding.default, headers: headers).responseString { (fundrespone) in
                            if fundrespone.result.error == nil{
                                print(fundrespone.result.value)
                                
                            }else{
                                print(fundrespone.result.error)
                            }
                        }
                        
                        
                    }
                }
                catch let error{
                    debugPrint(error as Any)
                }
                
                self.performSegue(withIdentifier: "goToSummaryPlan", sender: self)
                //print(respone.result.value)
            } else{
                print(respone.result.error)
            }
        }

    }
    
    
    
   
}



struct FundNAV{
    var fund: fundRatio!
    var NAV: Double!
    init(fund : fundRatio, NAV: Double) {
        self.fund = fund
        self.NAV = NAV
    }
}
struct fundTypes{
    var type: String
    var list : [FundNAV]
    init(type: String) {
        self.type  = type
        self.list = [FundNAV]()
    }

}

