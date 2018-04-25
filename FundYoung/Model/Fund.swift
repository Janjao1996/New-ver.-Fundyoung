//
//  Fund.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation


struct Fund : Decodable{
 
    public private(set) var name: String!
    public private(set) var risk: Int!
    public private(set) var type: String!
    private enum CodingKeys: String,CodingKey{
        case name = "name"
        case risk = "risk"
        case type = "type"
    }
    
}
/*struct name: Codable {
    var name: String?
    private enum CodingKeys: String,CodingKey{
        case name = "name"
    }
}
struct id: Codable {
    var id: Int?
    private enum CodingKeys: String,CodingKey{
        case id = "id"
    }
}
struct risk: Codable {
    var risk: Int?
    private enum CodingKeys: String,CodingKey{
        case risk = "risk"
    }
}
struct type: Codable {
    var type: String?
    private enum CodingKeys: String,CodingKey{
        case type = "type"
    }
}

*/
