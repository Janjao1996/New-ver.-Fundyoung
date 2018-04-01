//
//  PlanDataService.swift
//  FundYoung
//
//  Created by Janjao on 20/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation

class PlanDataService{
    static let instance = PlanDataService()
    private let shortTermPlan = [
        Plan(Id : 0,PlanName: "RoadTrip to U.S.", Target: 200000, NumberOfYear: 3),
        Plan(Id : 1, PlanName: "RoadTrip to Japan", Target: 200000, NumberOfYear: 3),
        Plan(Id : 2,PlanName: "RoadTrip to Thailand", Target: 200000, NumberOfYear: 3)
    ]
    private let longTermPlan = [
         Plan(Id : 3,PlanName: "Home1", Target: 5000000, NumberOfYear: 20),
         Plan(Id : 4, PlanName: "Home2", Target: 5000000, NumberOfYear: 20),
       
    ]
    func getShortTermPlan() -> [Plan]{
        return shortTermPlan
    }
    func getLongTermPlan() -> [Plan] {
        return longTermPlan
    }
    func getPlan(forPlanID : Int) -> Plan {
        print("get plan")
        return Plan(Id : 0,PlanName: "RoadTrip to U.S.", Target: 200000, NumberOfYear: 3)
    }
    func getNAV() -> Float{
        return 0
    }
    
    
}


