//
//  Question.swift
//  FundYoung
//
//  Created by Janjao on 22/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
struct  Question {
    var question: String!
    var answer1: String!
    var answer2: String!
    var answer3: String
    var answer4: String
    
    init( question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        
    }
    
}
