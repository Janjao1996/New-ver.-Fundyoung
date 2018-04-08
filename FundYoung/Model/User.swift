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
    private(set) public var Email: String
    private(set) public var Password: passwd
    private(set) public var DOB: Date
    
    
    /*private(set) public var Email: Email
    private(set) public var Password: Password
    private(set) public var DOB: DOB*/
 
    
    init( FistName: String, LastName: String, Email: String, Password: passwd, DOB : Date) {
        self.FirstName = FistName
        self.LastName = LastName
        self.Email = Email
        self.Password = Password
        self.DOB = DOB
       
    }
}
