//
//  News.swift
//  FundYoung
//
//  Created by Janjao on 15/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation
struct  News {
    
    private(set) public var id : Int!
    private(set) public var Title: String!
    private(set) public var ImageName: String!
    private(set) public var Content: String!
    
    init(id: Int, title: String, imageName: String, content: String) {
        self.id = id
        self.Title = title
        self.Content = content
        self.ImageName = imageName
    }
    
}
