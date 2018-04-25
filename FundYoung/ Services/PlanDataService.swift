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


class PlanDataService{
    static let instance = PlanDataService()
    private let Plans = [Plan(Id : 0,PlanName: "RoadTrip to U.S.", Target: 200000, NumberOfYear: 3),
        Plan(Id : 1, PlanName: "RoadTrip to Japan", Target: 200000, NumberOfYear: 3),
        Plan(Id : 2,PlanName: "RoadTrip to Thailand", Target: 200000, NumberOfYear: 3),
        Plan(Id : 1, PlanName: "Home2", Target: 5000000, NumberOfYear: 20)
    ]
    var tempReturn: Int!
    var TemperarydPlan = Plan(Id: 0, PlanName: "", Target: 0, NumberOfYear: 0)
    var tempfundRatoList = [fundRatio]()
    
    
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
                        let name = fund["name"] as? String ?? ""
                        let risk = fund["risk"] as? Int ?? 0
                        let type = fund["type"] as? String ?? ""
                        let ratio = x["ratio"] as? Double ?? 0.0
                        let getfund = Fund(name: name, risk: risk, type: type)
                        var fundratio = fundRatio(fund: getfund, ratio: ratio)
                        FundDataService.instance.requestFundReturn(fundID: name, completionHandle: { (return_) in
                            let twodigitReturn = Double(round(100*return_)/100)
                            fundratio.fundreturn = twodigitReturn
                        })

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
            sum = sum + (item.ratio * Double(item.fund.risk))
        }
        let twodigitTotalRisk = Double((sum/100)*100)/100
        return twodigitTotalRisk
    }
    func getTotalReturn()-> Double{
        var sum = 0.0
        for item in tempfundRatoList{
            sum = sum + (item.ratio * item.fundreturn)
        }
        let twodigitTotalReturn = Double((sum/100)*100)/100
        return twodigitTotalReturn
    }
    func getPlans() -> [Plan]{
        return Plans
    }
   
    func getPlan(forPlanID : Int) -> Plan {
        print("get plan")
        
        return Plans[forPlanID]
    }
    func getNAV() -> Float{
        return 0
    }
    func InvestOnce() ->Int{
        
        return 0
    }
    func InvestMonthly() -> Int {
        return 0
    }
    func InvestSomeInit(invest: Int) -> Int {
        return 0
    }
    
}


