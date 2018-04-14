//
//  NewsVC.swift
//  FundYoung
//
//  Created by Janjao on 14/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
       
    }

  

}
