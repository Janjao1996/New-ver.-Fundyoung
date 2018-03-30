//
//  Plan.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

//

import Foundation
struct  Plan {
    var Id: Int!
    var PlanName: String!
    var Target: Int!
    var NumberOfYear: Int!
    var Risk: Int!
    var FundList = [Fund]()
    // var Assesment = [Question]()
    
    init(Id: Int, PlanName: String, Target : Int, NumberOfYear:Int) {
        self.Id = Id
        self.PlanName = PlanName
        self.Target = Target
        self.NumberOfYear = NumberOfYear
    }
    
}





