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
    var answerList = [Answer]()
    
    init( question: String) {
        self.question = question
      
    }
    
    
}
