//
//  KnowledgeVC.swift
//  FundYoung
//
//  Created by Janjao on 14/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class KnowledgeVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var knowledge1Btn: UIButton!
    
    @IBOutlet weak var knowledge1Img: UIImageView!
    
    @IBOutlet weak var knowledgeTitle2: UIButton!
    
    @IBOutlet weak var knowledgeImg2: UIImageView!
    
    @IBOutlet weak var knowledge2: UIStackView!
    @IBOutlet weak var knowledge1: UIStackView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        knowledge1.sizeToFit()
        knowledge2.sizeToFit()
        
    }

  
    @IBAction func title1Pressed(_ sender: Any) {
        
        
        knowledge1Img.isHidden = !knowledge1Img.isHidden
        
    }
    @IBAction func title2Pressed(_ sender: Any) {
        
        knowledgeImg2.isHidden = !knowledgeImg2.isHidden
    }
    
    
}
