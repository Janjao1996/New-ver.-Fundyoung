//
//  Answer.swift
//  FundYoung
//
//  Created by Janjao on 13/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
struct Answer {
    var answer: String!
    var mark: Int!
    var choosed: Bool
    init(answer: String, mark: Int) {
        self.answer = answer
        self.mark = mark
        choosed = false
    }
}
