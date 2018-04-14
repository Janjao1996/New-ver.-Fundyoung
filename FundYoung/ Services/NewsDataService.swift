//
//  NewsDataService.swift
//  FundYoung
//
//  Created by Janjao on 15/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
class NewsDataService {
    static let instance = NewsDataService()
    private let news = [
        News(id: 0,title: "News1", imageName: "news1.png", content: "..... The news is ...."),
        News(id: 1, title: "News2", imageName: "news2.png", content: "..... The news is ...."),
        News(id: 2, title: "News3", imageName: "news3.png", content: "..... The news is ...."),
        News(id: 3, title: "News4", imageName: "news4.png", content: "..... The news is ....")
    ]
    func getNews() -> [News] {
        return news
    }
    func getNewsById(id: Int) -> News{
        switch id {
        case 0:
            return news[0]
        case 1:
            return news[1]
        case 2:
            return news[2]
        case 3:
            return news[3]
        default:
            break
        }
        return news[0]
        
    }

}

