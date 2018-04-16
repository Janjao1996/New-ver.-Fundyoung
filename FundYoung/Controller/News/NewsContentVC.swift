//
//  NewsContentVC.swift
//  FundYoung
//
//  Created by Janjao on 15/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class NewsContentVC: UIViewController {
    
    
  
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var contentLbl: UILabel!
    
   
    
    var news_: News!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsImage.image = UIImage(named: news_.ImageName)
        titleLbl.text = news_.Title
        contentLbl.text = news_.Content
        titleLbl.sizeToFit()
        contentLbl.sizeToFit()
     
        

    }

    func initNews(news: News){
      news_ = NewsDataService.instance.getNewsById(id: news.id)
    }

   
    
}
