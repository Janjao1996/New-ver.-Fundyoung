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
    var activityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
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
                    PlanDataService.instance.tempfundRatoList[x].fundreturn = twodigitReturn
                    self.FundTable.reloadData()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    self.activityIndicator.stopAnimating()
                })
               
            }
          
            self.portRiskLabel.text = "Your Port Risk : " + String(PlanDataService.instance.getTotalRisk())
            self.pieChartUpdate()

        }
       

     
        FundTable.sizeToFit()
     
    }
    
    
    
    
    
    func pieChartUpdate(){
        let dataSet = getDataSet(risk: PlanDataService.instance.TemperarydPlan.Risk)
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = nil
        dataSet.colors = ChartColorTemplates.material()
      //  dataSet.sliceSpace = 2
     //   dataSet.yValuePosition = PieChartDataSet.ValuePosition.outsideSlice
        pieChart.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pieChart.holeRadiusPercent = 0.4
        pieChart.drawEntryLabelsEnabled = false
        pieChart.drawHoleEnabled = true
        pieChart.transparentCircleRadiusPercent = 0.5
        pieChart.rotationEnabled = false
        pieChart.holeColor = UIColor.clear
        pieChart.legend.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pieChart.notifyDataSetChanged()
    }
    
    func getDataSet(risk: Int) -> PieChartDataSet {
        let dataSet = PlanDataService.instance.getFundWeightChart(risk: risk)
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

