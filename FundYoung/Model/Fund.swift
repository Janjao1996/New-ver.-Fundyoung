//
//  Fund.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
struct Fund {
    private(set) public var FundName: String
    private(set) public var Risk: Int
    private(set) public var Return: Int
    public var Percentage: Int
    init( FundName: String, Risk: Int, Return: Int) {
        self.FundName = FundName
        self.Return = Return
        self.Risk = Risk
        self.Percentage = 0
    }
}
