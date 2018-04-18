//
//  FundDataService.swift
//  FundYoung
//
//  Created by Janjao on 18/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
import Charts
import Alamofire
import SwiftyJSON
import FirebaseAuth

class  FundDataService {
    static let instance = FundDataService()
    
    var Funds = [Fund]()
    
    
    
    private var Types = ["Equity","Bond","Money Market","Commodities"]
    func getTypes()-> [String]{
        return Types
    }
    func requestAllFundData() {
        let URL = "https://fundyoung.herokuapp.com/allfunds"
        let idToken = UserDefaults.standard.string(forKey: "UserToken")
        print(idToken)
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + idToken!
        ]
        Alamofire.request(URL, method: .get , parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
            if response.result.error == nil {
                guard let data = response.data else{return}
                do {
                    self.Funds = try JSONDecoder().decode([Fund].self , from: data)
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
    
    
    func getAllFunds() -> [Fund] {
        return Funds
        
    }
   
    func getFundsByTypes(type: String) -> [Fund]{
        
        return Funds
    }
    func getFundByRisk(risk: Int) -> [fundRatio] {
        var funds = [fundRatio]()
        switch risk {
        case 1:
            let fund1 = fundRatio(fund: Funds[0], ratio: 70.0)
            let fund2 = fundRatio(fund: Funds[0], ratio: 30.0)
            funds.append(fund1)
            funds.append(fund2)
            return funds
        case 2:
            let fund1 = fundRatio(fund: Funds[0], ratio: 16.0)
            let fund2 = fundRatio(fund: Funds[0], ratio: 16.0)
            let fund3 = fundRatio(fund: Funds[0], ratio: 20.0)
            let fund4 = fundRatio(fund: Funds[0], ratio: 48.0)
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            return funds
        case 3:
            let fund1 = fundRatio(fund: Funds[0], ratio: 16.0)
            let fund2 = fundRatio(fund: Funds[0], ratio: 32.0)
            let fund3 = fundRatio(fund: Funds[0], ratio: 15.0)
            let fund4 = fundRatio(fund: Funds[0], ratio: 35.0)
            let fund5 = fundRatio(fund: Funds[4], ratio: 2.0)
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            funds.append(fund5)
            return funds
        case 4:
            let fund1 = fundRatio(fund: Funds[0], ratio: 20.0)
            let fund2 = fundRatio(fund: Funds[1], ratio: 48.0)
            let fund3 = fundRatio(fund: Funds[2], ratio: 10.0)
            let fund4 = fundRatio(fund: Funds[3], ratio: 20.0)
            let fund5 = fundRatio(fund: Funds[4], ratio: 2.0)
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            funds.append(fund5)
            return funds
        case 5:
            let fund1 = fundRatio(fund: Funds[0], ratio: 24.0)
            let fund2 = fundRatio(fund: Funds[1], ratio: 68.0)
            let fund3 = fundRatio(fund: Funds[2], ratio: 5.0)
            let fund4 = fundRatio(fund: Funds[3], ratio: 3.0)
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            return funds
        default:
            break
        }
        return funds
    }

    func getFundWeightChart(risk:Int)-> PieChartDataSet {
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
            let entry4 = PieChartDataEntry(value: Double(35.0), label: "#ตราสารหนี้")
            let entry5 = PieChartDataEntry(value: Double(2.0), label: "#สินค้าโภคภัณฑ์")
            let dataSet = PieChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "Fund")
            return dataSet
        case 4:
            let entry1 = PieChartDataEntry(value: Double(20.0), label: "#ตราสารผสม")
            let entry2 = PieChartDataEntry(value: Double(48.0), label: "#ตรสารทุน")
            let entry3 = PieChartDataEntry(value: Double(10.0), label: "#สินทรัพย์สภาพคล่อง")
            let entry4 = PieChartDataEntry(value: Double(20.0), label: "#ตราสารหนี้")
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
}
 
