//
//  Question4.swift
//  FundYoung
//
//  Created by Janjao on 23/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class Question4VC: UIViewController {

    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var answer1Btn: UIButton!
    
    
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    
    @IBOutlet weak var answer4Btn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let question = AssessmentDataService.instance.getQuestions()[3]
        questionLbl.text = question.question
        answer1Btn.setTitle(question.answer1, for: .normal)
        answer2Btn.setTitle(question.answer2, for: .normal)
        answer3Btn.setTitle(question.answer3, for: .normal)
        answer4Btn.setTitle(question.answer4, for: .normal)
        
        // Do any additional setup after loading the view.
    }

}
