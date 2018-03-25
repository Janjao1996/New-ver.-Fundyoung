//
//  FundDataService.swift
//  FundYoung
//
//  Created by Janjao on 18/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation

class  FundDataService {
    static let instance = FundDataService()
    private let Funds = [
        Fund(FundName: "SCBSET50", Risk: 5, Return: 5),
        Fund(FundName: "SCBFP", Risk: 4, Return: 4),
        Fund(FundName: "SCBTMFPLUS-P", Risk: 6, Return: 7)
    ]
    
    func getFunds() -> [Fund]{
        return Funds
    }
}
 
