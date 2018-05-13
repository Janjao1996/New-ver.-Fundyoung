//
//  Fund.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation


struct Fund : Decodable{
 
    public private(set) var name: String!
    public private(set) var risk: Int!
    public private(set) var type: String!
    private enum CodingKeys: String,CodingKey{
        case name = "name"
        case risk = "risk"
        case type = "type"
    }
    
}

struct FundNAV{
    var fund: fundRatio!
    var NAV: Double!
    var totalNAV: Double
    var investvalue: Int
    var profit: Double
    var totalunit: Int
    init(fund : fundRatio, NAV: Double) {
        self.fund = fund
        self.NAV = NAV
        self.totalNAV = 0
        self.investvalue = 0
        self.profit = 0
        self.totalunit = 0
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
struct insertFund{
    var fundID: String!
    var weigth: Double!
    var investUnit: Int!
    var investvalue: Int!
    init(fundID: String, weigth: Double!, investUnit: Int, investValue: Int) {
        self.fundID = fundID
        self.weigth = weigth
        self.investUnit = investUnit
        self.investvalue = investValue
        
    }
}


