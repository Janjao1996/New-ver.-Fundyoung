//
//  User.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import Foundation

struct  User {
    private(set) public var FirstName: String
    private(set) public var LastName: String
    /*private(set) public var Email: Email
    private(set) public var Password: Password
    private(set) public var DOB: DOB*/
 
    
    init( FistName: String, LastName: String) {
        self.FirstName = FistName
        self.LastName = LastName
       
    }
}
