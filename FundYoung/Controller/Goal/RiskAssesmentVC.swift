//
//  Question1.swift
//  FundYoung
//
//  Created by Janjao on 23/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class RiskAssessmentVC: UIViewController {
    
    
    @IBOutlet weak var Q1: UILabel!
    @IBOutlet weak var Q1A1: UILabel!
    @IBOutlet weak var Q1A2: UILabel!
    @IBOutlet weak var Q1A3: UILabel!
    @IBOutlet weak var Q1A4: UILabel!


    @IBOutlet weak var Q2: QuestionLabel!
    @IBOutlet weak var Q2A1: UILabel!
    @IBOutlet weak var Q2A2: UILabel!
    
    @IBOutlet weak var Q3: UILabel!
    @IBOutlet weak var Q3A1: UILabel!
    @IBOutlet weak var Q3A2: UILabel!
    @IBOutlet weak var Q3A3: UILabel!
    @IBOutlet weak var Q3A4: UILabel!
    
    @IBOutlet weak var Q4: UILabel!
    @IBOutlet weak var Q4A1: UILabel!
    @IBOutlet weak var Q4A2: UILabel!
    @IBOutlet weak var Q4A3: UILabel!
    @IBOutlet weak var Q4A4: UILabel!
    
    @IBOutlet weak var Q5: UILabel!
    @IBOutlet weak var Q5A1: UILabel!
    @IBOutlet weak var Q5A2: UILabel!
    @IBOutlet weak var Q5A3: UILabel!
    @IBOutlet weak var Q5A4: UILabel!
    
    @IBOutlet weak var Q6: UILabel!
    @IBOutlet weak var Q6A1: UILabel!
    @IBOutlet weak var Q6A2: UILabel!
    @IBOutlet weak var Q6A3: UILabel!
    @IBOutlet weak var Q6A4: UILabel!
    
    @IBOutlet weak var Q7: UILabel!
    @IBOutlet weak var Q7A1: UILabel!
    @IBOutlet weak var Q7A2: UILabel!
    @IBOutlet weak var Q7A3: UILabel!
    @IBOutlet weak var Q7A4: UILabel!
    
    @IBOutlet weak var Q8: UILabel!
    @IBOutlet weak var Q8A1: UILabel!
    @IBOutlet weak var Q8A2: UILabel!
    @IBOutlet weak var Q8A3: UILabel!
    @IBOutlet weak var Q8A4: UILabel!
    
    @IBOutlet weak var Q9: UILabel!
    @IBOutlet weak var Q9A1: UILabel!
    @IBOutlet weak var Q9A2: UILabel!
    @IBOutlet weak var Q9A3: UILabel!
    @IBOutlet weak var Q9A4: UILabel!
    
    @IBOutlet weak var Q10: UILabel!
    @IBOutlet weak var Q10A1: UILabel!
    @IBOutlet weak var Q10A2: UILabel!
    @IBOutlet weak var Q10A3: UILabel!
    @IBOutlet weak var Q10A4: UILabel!
    
    @IBOutlet weak var Q11: UILabel!
    @IBOutlet weak var Q11A1: UILabel!
    @IBOutlet weak var Q11A2: UILabel!
    
    
    
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let question = AssessmentDataService.instance.getQuestions()
        Q1.text = "1) " + question[0].question
        Q1A1.text = question[0].answerList[0].answer
        Q1A2.text = question[0].answerList[1].answer
        Q1A3.text = question[0].answerList[2].answer
        Q1A4.text = question[0].answerList[3].answer
        Q2.text = "2) " + question[1].question
        Q2A1.text = question[1].answerList[0].answer
        Q2A2.text = question[1].answerList[1].answer
        Q3.text = "3) " + question[2].question
        Q3A1.text = question[2].answerList[0].answer
        Q3A2.text = question[2].answerList[1].answer
        Q3A3.text = question[2].answerList[2].answer
        Q3A4.text = question[2].answerList[3].answer
        Q4.text = "4) " + question[3].question
        Q4A1.text = question[3].answerList[0].answer
        Q4A2.text = question[3].answerList[1].answer
        Q4A3.text = question[3].answerList[2].answer
        Q4A4.text = question[3].answerList[3].answer
        Q5.text = "5) " + question[4].question
        Q5A1.text = question[4].answerList[0].answer
        Q5A2.text = question[4].answerList[1].answer
        Q5A3.text = question[4].answerList[2].answer
        Q5A4.text = question[4].answerList[3].answer
        Q6.text = "6) " + question[5].question
        Q6A1.text = question[5].answerList[0].answer
        Q6A2.text = question[5].answerList[1].answer
        Q6A3.text = question[5].answerList[2].answer
        Q6A4.text = question[5].answerList[3].answer
        Q7.text = "7) " + question[6].question
        Q7A1.text = question[6].answerList[0].answer
        Q7A2.text = question[6].answerList[1].answer
        Q7A3.text = question[6].answerList[2].answer
        Q7A4.text = question[6].answerList[3].answer
        Q8.text = "8) " + question[7].question
        Q8A1.text = question[7].answerList[0].answer
        Q8A2.text = question[7].answerList[1].answer
        Q8A3.text = question[7].answerList[2].answer
        Q8A4.text = question[7].answerList[3].answer
        Q9.text = "9) " + question[8].question
        Q9A1.text = question[8].answerList[0].answer
        Q9A2.text = question[8].answerList[1].answer
        Q9A3.text = question[8].answerList[2].answer
        Q9A4.text = question[8].answerList[3].answer
        Q10.text = "10) " + question[9].question
        Q10A1.text = question[9].answerList[0].answer
        Q10A2.text = question[9].answerList[1].answer
        Q10A3.text = question[9].answerList[2].answer
        Q10A4.text = question[9].answerList[3].answer
        Q11.text = "11) " + question[10].question
        Q11A1.text = question[10].answerList[0].answer
        Q11A2.text = question[10].answerList[1].answer
      

        
       
        
      

        // Do any additional setup after loading the view.
    }
    
    /*
    func printQuestion(question: [Question]) {
        for x in 0...question.count-1{
            let ques = QuestionLabel()
            let posiY = x * 170 + 20
            ques.CreateQuestionLbl(question: question[x].question, positionX: 20, positionY: Double(posiY) )
            self.longView.addSubview(ques)
            for y in 0...question[x].answerList.count-1{
                let ans = AnswerLbl()
                let posiYAns =  y * 30 + posiY + 50
                ans.CreateAnsLbl(Ans: question[x].answerList[y].answer, positionX: 40, positionY: Double(posiYAns))
                self.longView.addSubview(ans)
               
            }
        }
 
    }*/

 
}
