//
//  NewsTableCell.swift
//  FundYoung
//
//  Created by Janjao on 15/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class NewsTableCell: UITableViewCell {
    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsImage : UIImageView!
    func updateView(news: News) {
        NewsImage.image = UIImage(named: news.ImageName)
        NewsTitle.text = news.Title
    }
    
}
