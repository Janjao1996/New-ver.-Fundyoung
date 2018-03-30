//
//  FundDataService.swift
//  FundYoung
//
//  Created by Janjao on 18/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
import Charts

class  FundDataService {
    static let instance = FundDataService()
    private var Funds = [
        Fund(FundName: "SCBSET50", Risk: 5, Return: 5),
        Fund(FundName: "SCBFP", Risk: 4, Return: 4),
        Fund(FundName: "SCBTMFPLUS-P", Risk: 6, Return: 7),
        Fund(FundName: "SCBSET501", Risk: 5, Return: 5),
        Fund(FundName: "SCBFP1", Risk: 4, Return: 4),
        Fund(FundName: "SCBTMFPLUS-P1", Risk: 6, Return: 7)
    ]
    
    func getFunds() -> [Fund]{
        return Funds
    }
    func getFundByRisk(risk: Int) -> [Fund] {
        var funds = [Fund]()
        switch risk {
        case 1:
            var fund1 = Funds[0]
            fund1.Percentage = 70
            var fund2 = Funds[1]
            fund2.Percentage = 30
            funds.append(fund1)
            funds.append(fund2)
            return funds
        case 2:
            var fund1 = Funds[0]
            var fund2 = Funds[1]
            var fund3 = Funds[2]
            var fund4 = Funds[3]
            fund1.Percentage = 16
            fund2.Percentage = 16
            fund3.Percentage = 20
            fund4.Percentage = 48
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            return funds
        case 3:
            var fund1 = Funds[0]
            var fund2 = Funds[1]
            var fund3 = Funds[2]
            var fund4 = Funds[3]
            var fund5 = Funds[4]
            fund1.Percentage = 16
            fund2.Percentage = 32
            fund3.Percentage = 15
            fund4.Percentage = 35
            fund5.Percentage = 2
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            funds.append(fund5)
            return funds
            
        case 4:
            var fund1 = Funds[0]
            var fund2 = Funds[1]
            var fund3 = Funds[2]
            var fund4 = Funds[3]
            var fund5 = Funds[4]
            fund1.Percentage = 20
            fund2.Percentage = 48
            fund3.Percentage = 10
            fund4.Percentage = 20
            fund5.Percentage = 2
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            funds.append(fund5)
            return funds
        case 5:
            var fund1 = Funds[0]
            var fund2 = Funds[1]
            var fund3 = Funds[2]
            var fund4 = Funds[3]
            fund1.Percentage = 24
            fund2.Percentage = 68
            fund3.Percentage = 5
            fund4.Percentage = 3
            funds.append(fund1)
            funds.append(fund2)
            funds.append(fund3)
            funds.append(fund4)
            return funds
        default:
            var fund1 = Funds[0]
            fund1.Percentage = 100
            funds.append(fund1)
            return funds
        }
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
 
