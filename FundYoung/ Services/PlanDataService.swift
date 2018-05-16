//
//  PlanDataService.swift
//  FundYoung
//
//  Created by Janjao on 20/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Charts

class PlanDataService{
    static let instance = PlanDataService()
    var plans = [Plan]()
    var tempReturn: Int!
    var TemperarydPlan = Plan(Id: 0, PlanName: "", Target: 0, NumberOfYear: 0)
    var tempfundRatoList = [fundRatio]()
    var temAverageReturn = 0.0
    var tempAverageRisk  = 0.0
    var planFunds = [FundNAV]()
    var totalPort = 0
    var targetPlan = 0
    func requestPlan(completionHandle: @escaping ([Plan])-> ())  {
        let URL = "https://fundyoung.herokuapp.com/getplan"
        print(URL)
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer " + Token!
        ]
        
        Alamofire.request(URL, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
                do {
                    print(response.result.value)
                    let temp = response.result.value as! [[String: Any]]
                    for x in temp{
                        let id = x["id"] as? Int ?? 0
                        let name = x["name"] as? String ?? ""
                        let target = x["target"] as? Int ?? 0
                        let duration = x["duration"] as? Int ?? 0
                        //let ratio = x["startdate"] as? String ?? ""

                        let plan = Plan(Id: id, PlanName: name, Target: target, NumberOfYear: duration)
                        self.plans.append(plan)
                    }
                    completionHandle(self.plans)
                    
                }
                catch let error{
                    debugPrint(error as Any)
                }
                
            }
            else{
                debugPrint(response.result.error as Any)
            }
        })
        
        
    }
    
    func requestFundByRisk(Risk: Int , completionHandle: @escaping ([fundRatio])-> ())  {
        let URL = "https://fundyoung.herokuapp.com/fundrisk/" + String(Risk)
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer " + Token!
        ]
        
        Alamofire.request(URL, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
                do {
                    //print(response.result.value)
                    let temp = response.result.value as! [[String: Any]]
                    for x in temp{
                        let fund =  x["fund"] as! [String: Any]
                        let name = fund["fundid"] as? String ?? ""
                        let risk = fund["risk"] as? Int ?? 0
                        let type = fund["type"] as? String ?? ""
                        let ratio = x["ratio"] as? Double ?? 0.0
                        let getfund = Fund(name: name, risk: risk, type: type)
                        var fundratio = fundRatio(fund: getfund, ratio: ratio)
                        self.tempfundRatoList.append(fundratio)
                    }
                    completionHandle(self.tempfundRatoList)
                    
                }
                catch let error{
                    debugPrint(error as Any)
                }
                
            }
            else{
                debugPrint(response.result.error as Any)
            }
        })
        
        
    }
    

    
    func getTotalRisk()-> Double{
        var sum = 0.0
        for item in tempfundRatoList{
            sum = sum + ((item.ratio) * Double(item.fund.risk))
        }
        let twodigitTotalRisk = Double((sum/100)*100)/100
        tempAverageRisk = twodigitTotalRisk
        return tempAverageRisk
    }
    func getTotalReturn()-> Double{
        var sum = 0.0
        for item in tempfundRatoList{
            sum = sum + ((item.ratio * 0.01) * item.fundreturn)
        }
        let twodigitTotalReturn = Double((sum/100)*100)/100
        temAverageReturn = twodigitTotalReturn
        return temAverageReturn
    }

//    func getPlan(forPlanID : Int) -> Plan {
//        print("get plan")
//    }
 
    func InvestOnce() ->Int{
        let i = getTotalReturn()
        var pv = Double(TemperarydPlan.Target) / pow( 1.0 + i, Double(TemperarydPlan.NumberOfYear))
        return Int(pv)
    }
    func InvestMonthly() -> Int {
        var i = getTotalReturn()
            i = i / 12
        var pmt = Double(TemperarydPlan.Target) / (((pow((1 + i),(Double(TemperarydPlan.NumberOfYear) * 12))) - 1) / i )
 
        return Int(pmt)
    }
    func InvestSomeInit(invest: Int) -> Int {
        var i = getTotalReturn()
            i = i / 12
        var fv = Double(invest) * (pow(Double(1 + i), Double(TemperarydPlan.NumberOfYear) * 12))
        var fv2 = TemperarydPlan.Target - Int(fv)
        var pmt = Double(fv2) / (((pow((1 + i),(Double(TemperarydPlan.NumberOfYear) * 12))) - 1) / i )
        
        
        return Int(pmt)
    }
    func getFundWeightChart(risk:Int)-> PieChartDataSet {
        var entries = [PieChartDataEntry]()
        for x in 0...tempfundRatoList.count-1{
            let entry = PieChartDataEntry(value: tempfundRatoList[x].ratio, label: tempfundRatoList[x].fund.type)
            entries.append(entry)
        }
        let dataSet = PieChartDataSet(values: entries, label: nil)
        return dataSet
        
    }
    func getfundPlanByID(planId: String , completionHandle: @escaping ([FundNAV], [Plan])-> ())  {
        let URL_GETPLAN = "https://fundyoung.herokuapp.com/plan/" + planId        //print(URL_GETRETURN)
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer " + Token!
        ]
        
        Alamofire.request(URL_GETPLAN, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
               // guard let data = response.data else{return}
                print(response.result.value)
                do {
                    let temp = response.result.value as! [String: Any]
                    let planArray =  temp["plan"] as!  [[String:Any]]
                    let plan = planArray[0]
                        let name = plan["name"] as? String ?? ""
                        let target = plan["target"] as? Int ?? 0
                        let totalport = plan["porttotal"] as? Int ?? 0
                        let plan_ = SummaryPlanDetail(name: name, target: target, totalPort: self.totalPort)
                        let funds = plan["funds"] as? [[String: Any]]
                    for fund in funds!{
                            let fundID = fund["fundid"] as? String ?? ""
                            let totalNAV = fund["totalnav"] as? Double ?? 0
                            let type = fund["type"] as? String ?? ""
                            let weight = fund["value"] as? Double ?? 0
                            let NAV = fund["nav"] as? Double ?? 0
                            let invesunit = fund["investunit"] as? Int ?? 0
                            let investval = fund["investvalue"] as? Int ?? 0
                            let profit = fund["profit"] as? Double ?? 0
                            let getfund = Fund(name: fundID, risk: 0, type: type)
                            let fundratio = fundRatio(fund: getfund, ratio: weight)
                            var navFund = FundNAV(fund: fundratio, NAV: NAV)
                            navFund.totalNAV = totalNAV
                            navFund.investvalue = investval
                            navFund.totalunit = invesunit
                            navFund.profit = profit
                            self.planFunds.append(navFund)
                        }
                        
                    
                    completionHandle(self.planFunds, self.plans)
                }
                catch let error{
                    debugPrint(error as Any)
                }
            }
            else{
                debugPrint(response.result.error as Any)
            }
            
        })
        
        
    }
    func getPlanAll(completionHandle: @escaping ([Plan])-> ())  {
        let URL_GETPLAN = "https://fundyoung.herokuapp.com/plan/all"        //print(URL_GETRETURN)
        let Token = UserDefaults.standard.string(forKey: "UserToken")
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer " + Token!
        ]
        
        Alamofire.request(URL_GETPLAN, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
                // guard let data = response.data else{return}
                print("get plan ")
                print(response.result.value)
                do {
                    let temp = response.result.value as! [String: Any]
                    let planArray =  temp["plan"] as!  [[String:Any]]
                    //let plan = planArray[0]
                    for x in planArray{
                        let id = x["id"] as? Int ?? 0
                        let name = x["name"] as? String ?? ""
                        let target = x["target"] as? Int ?? 0
                        let totalport = x["porttotal"] as? Double ?? 0
                        let duration = x["duration"] as? Int ?? 0
                        var plan_ = Plan(Id: id, PlanName: name, Target: target, NumberOfYear: duration)
                        
                        plan_.totalPort = Int(totalport)
                        print(plan_.totalPort)
                        
                        self.plans.append(plan_)
                    }
                    
                    
                    completionHandle(self.plans)
                }
                catch let error{
                    debugPrint(error as Any)
                }
            }
            else{
                debugPrint(response.result.error as Any)
            }
            
        })
        
        
    }
    
    
}
struct SummaryPlanDetail{
    var name: String!
    var target: Int!
    var totalPort: Int!
    
}


