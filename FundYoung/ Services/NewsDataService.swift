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
        
        News(id: 1, title: "IPO Fund ข้อมูลกองทุนเปิดที่กำลังเสนอขาย", imageName: "news2.png", content: " "),
        News(id: 2, title: "บทสรุปซีรีส์ หรือจะถึงเวลา AI Hedge Fund ครองโลก?", imageName: "news3.png", content: " "),
        News(id: 0,title: "  ตลาดทั่วโลกถูกกดดันจาก โดนัลด์ ทรัมป์", imageName: "news1.png", content: "     ตลาดทั่วโลกถูกกดดันอีกครั้งจากการที่นายโดนัลด์ ทรัมป์ประกาศขึ้นภาษีนำเข้าสินค้าจากจีน ส่งผลให้นักลงทุนกังวลว่าจะเกิดสงครามการค้าโลก ทางด้านเฟดมีมติคงดอกเบี้ยและส่งสัญญาณว่าจะยังคงขึ้นดอกเบี้ยรวม 3 ครั้งในปีนี้ สำหรับตัวเลขการส่งออกและการท่องเที่ยวของไทยยังคงแข็งแกร่งต่อเนื่อง ")

    ]
    func getNews() -> [News] {
        return news
    }
    func getNewsById(id: Int) -> News{
        for x in news{
            if x.id == id {
                return x
            }
        }
        return news[0]
    }

}

